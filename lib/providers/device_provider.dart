import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDeviceDetailsMethod = Future<Device> Function(
    Request request, String id);

abstract class DeviceProvider extends ChangeNotifier {
  late String _deviceId;
  late Request _request;
  WidgetState _state = WidgetState.idle;
  Device? _deviceDetail;
  String _latestErrorMsg = "An error occurred.";

  DeviceProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails =
          DevicesRepository.getDeviceDetails}) {
    this._deviceId = deviceId;
    this._request = request;
    fetchData(getDetails: getDetails);
  }

  Future<Device?> fetchData(
      {GetDeviceDetailsMethod getDetails =
          DevicesRepository.getDeviceDetails}) async {
    setState = WidgetState.loading;

    try {
      _deviceDetail = await getDetails(_request, _deviceId);
      setState = WidgetState.idle;
    } catch (error) {
      setErrorState(error.toString());
      return null;
    }

    return _deviceDetail;
  }

  set setState(WidgetState newState) {
    _state = newState;
    notifyListeners();
  }

  Device? get deviceDetail => _deviceDetail;

  void setErrorState(String errorMsg) {
    _setErrorMessage = errorMsg;
    setState = WidgetState.error;
  }

  set _setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
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
