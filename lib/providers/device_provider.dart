import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as sdk;

typedef GetDeviceDetailsMethod = Future<sdk.Device> Function(
    sdk.Request request, String id);

abstract class DeviceProvider extends ChangeNotifier {
  static const int MAX_RETRIES = 10;
  static const int RETRY_DELAY_MS = 750;

  late String _deviceId;
  late sdk.Request _request;
  WidgetState _state = WidgetState.idle;
  sdk.Device? _deviceDetail;
  String _latestErrorMsg = "An error occurred.";

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
    _state = newState;
    notifyListeners();
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
        T state = getState();
        while (state != desiredState && numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);
          state = getState();
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

  sdk.State? state<T extends sdk.Trait, S extends sdk.State>() {
    return trait<T>()?.states.firstWhere((state) => state is S, orElse: null);
  }

  sdk.Trait? trait<T extends sdk.Trait>() {
    return deviceDetail?.traits.firstWhere((trait) => trait is T, orElse: null);
  }

  String get displayName;

  /// To know if this ChangeNotifier is fetching device data
  bool get isLoading => _state == WidgetState.loading;

  /// To know if this ChangeNotifier is performing an action
  bool get isPerformingAction => _state == WidgetState.performingAction;

  /// To know if this ChangeNotifier is busy from fetching data or running an action
  bool get isBusy =>
      (_state == WidgetState.loading || _state == WidgetState.performingAction);

  /// To know if this ChangeNotifier had an error
  /// see [getErrorMessage] to get the accomponying error message
  bool get isInErrorState => _state == WidgetState.error;

  /// Get the error message whenever this ChangeNotifier had an error
  /// See also: [isInErrorState]
  String get getErrorMessage => _latestErrorMsg;
}
