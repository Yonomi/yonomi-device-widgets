import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDeviceDetailsMethod = Future<Device> Function(
    Request request, String id);

typedef SendPowerMethod = Future<void> Function(
    Request request, String id, bool onOff);

class PowerTraitProvider extends ChangeNotifier {
  static const int MAX_RETRIES = 10;
  static const int RETRY_DELAY_MS = 750;

  WidgetState _currentState = WidgetState.idle;
  String _latestErrorMsg = "An error occurred.";

  late String _deviceId;

  late Request _request;

  Device? _deviceDetail;

  PowerTraitProvider(
    Request request,
    String deviceId, {
    GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
  }) {
    _request = request;
    _deviceId = deviceId;
    fetchData(getDeviceDetails: getDetails);
  }

  /// Fetches device data. When loaded, get the data with [getDeviceDetails]
  ///
  /// @throws ServerException for any errors returned by the platform
  Future<void> fetchData(
      {GetDeviceDetailsMethod getDeviceDetails =
          DevicesRepository.getDeviceDetails}) async {
    _setState = WidgetState.loading;

    try {
      _deviceDetail = await getDeviceDetails(_request, _deviceId);
      _setState = WidgetState.idle;
    } catch (error) {
      _setErrorState(error.toString());
      return null;
    }
  }

  /// Run the "makePowerActionRequest" mutation on this device
  ///
  /// @param desiredOnOffState use true to set power state to on, false otherwise
  /// @throws ServerException for any errors returned by the platform
  Future<void> sendPowerOnOffAction(bool desiredOnOffState,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    if (!isPerformingAction) {
      _setState = WidgetState.performingAction;

      try {
        await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

        int numRetries = 0;
        while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
          numRetries++;
        }
        _setState = WidgetState.idle;
      } catch (error) {
        _setErrorState(error.toString());
        await Future.delayed(Duration(seconds: 1))
            .then((_) => _setState = WidgetState.idle);
      }
    }
  }

  PowerTrait? getPowerTrait() {
    try {
      return _deviceDetail?.traits.first as PowerTrait?;
    } catch (error) {
      return null;
    }
  }

  Device? get deviceDetail => _deviceDetail;

  bool get getOnOffState {
    return getPowerTrait()?.state.value ?? false;
  }

  set _setState(WidgetState newState) {
    _currentState = newState;
    notifyListeners();
  }

  void _setErrorState(String errorMsg) {
    _setErrorMessage = errorMsg;
    _setState = WidgetState.error;
  }

  /// To know if this ChangeNotifier is busy from fetching data or running an action
  bool get isBusy => (_currentState == WidgetState.loading ||
      _currentState == WidgetState.performingAction);

  /// To know if this ChangeNotifier is fetching device data
  bool get isLoading => _currentState == WidgetState.loading;

  /// To know if this ChangeNotifier is performing an action
  bool get isPerformingAction => _currentState == WidgetState.performingAction;

  /// To know if this ChangeNotifier had an error
  /// see [getErrorMessage] to get the accomponying error message
  bool get isInErrorState => _currentState == WidgetState.error;

  set _setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  /// Get the error message whenever this ChangeNotifier had an error
  /// See also: [isInErrorState]
  String get getErrorMessage => _latestErrorMsg;
}
