import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as sdk;

typedef GetDeviceDetailsMethod = Future<sdk.Device> Function(
    sdk.Request request, String id);

abstract class DeviceProvider extends ChangeNotifier {
  static const int MAX_RETRIES = 10;
  static const int RETRY_DELAY_MS = 750;

  late String _deviceId;
  late sdk.Request _request;

  bool _isDisposed = false;
  WidgetState _state = WidgetState.idle;
  sdk.Device? _deviceDetail;
  String _latestErrorMsg = StringConstants.AN_ERROR_OCCURRED;

  DeviceProvider(sdk.Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails =
          sdk.DevicesRepository.getDeviceDetails}) {
    this._deviceId = deviceId;
    this._request = request;
    fetchData(getDetails: getDetails);
  }

  Future<void> fetchData(
      {GetDeviceDetailsMethod getDetails =
          sdk.DevicesRepository.getDeviceDetails}) async {
    setState = WidgetState.loading;

    try {
      _deviceDetail = await getDetails(_request, _deviceId);
      setState = WidgetState.idle;
    } catch (error) {
      setErrorState(error.toString());
    }
  }

  set setState(WidgetState newState) {
    if (!this._isDisposed) {
      _state = newState;
      notifyListeners();
    }
  }

  void dispose() {
    this._isDisposed = true;
    super.dispose();
  }

  sdk.Device? get deviceDetail => _deviceDetail;

  void setErrorState(String errorMsg) {
    _setErrorMessage = errorMsg;
    setState = WidgetState.error;
  }

  set _setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  Future<void> performAction<T>(
      T desiredState, Function getState, Function action,
      {GetDeviceDetailsMethod getDetails =
          sdk.DevicesRepository.getDeviceDetails}) async {
    if (!isPerformingAction) {
      setState = WidgetState.performingAction;

      try {
        await action();
        int numRetries = 0;
        T currentState = getState();
        while (!_checkEquality(desiredState, currentState) &&
            numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);
          currentState = getState();
          await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
          numRetries++;
        }

        setState = WidgetState.idle;
      } catch (error) {
        setErrorState(error.toString());
        await Future.delayed(Duration(seconds: 1))
            .then((_) => setState = WidgetState.idle);
      }
    }
  }

  bool _checkEquality(desiredState, state) {
    if (desiredState is Iterable)
      return const DeepCollectionEquality.unordered()
          .equals(desiredState, state);
    else
      return state == desiredState;
  }

  sdk.Trait? trait<T extends sdk.Trait>() {
    return deviceDetail?.traits.firstWhere((trait) => trait is T,
        orElse: () => sdk.UnknownTrait(displayName));
  }

  String get displayName;

  /// ChangeNotifier is fetching device data
  bool get isLoading => _state == WidgetState.loading;

  /// ChangeNotifier is performing an action
  bool get isPerformingAction => _state == WidgetState.performingAction;

  /// ChangeNotifier is busy from fetching data or running an action
  bool get isBusy =>
      (_state == WidgetState.loading || _state == WidgetState.performingAction);

  /// ChangeNotifier had an error
  /// see [getErrorMessage] to get the accompanying error message
  bool get isInErrorState => _state == WidgetState.error;

  /// Get the error message whenever this ChangeNotifier had an error
  /// See also: [isInErrorState]
  String get getErrorMessage => _latestErrorMsg;
}
