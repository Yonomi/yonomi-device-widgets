import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/traits/trait_based_device_screen.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDeviceDetailsMethod = Future<Device> Function(
    Request request, String id);

typedef SendPowerMethod = Future<void> Function(
    Request request, String id, bool onOff);

enum PowerState { idle, loading, performingAction, error }

class PowerTraitProvider extends ChangeNotifier {
  final int MAX_RETRIES = 10;
  final int RETRY_DELAY_MS = 750;

  PowerState _currentState = PowerState.idle;
  String _latestErrorMsg = "An error occurred.";

  late String _deviceId;

  late Request _request;

  Device? _deviceDetail;

  PowerTraitProvider(
    @required Request request,
    @required String deviceId, {
    GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
  }) {
    _request = request;
    _deviceId = deviceId;
    fetchData(getDeviceDetails: getDetails);
  }

  Future<Device?> fetchData(
      {GetDeviceDetailsMethod getDeviceDetails =
          DevicesRepository.getDeviceDetails}) async {
    _setState = PowerState.loading;

    try {
      _deviceDetail = await getDeviceDetails(_request, _deviceId);
      _setState = PowerState.idle;
    } catch (error) {
      _setErrorState(error.toString());
      return null;
    }

    return deviceDetail;
  }

  Future<void> sendPowerOnOffAction(bool desiredOnOffState,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    if (!isPerformingAction) {
      _setState = PowerState.performingAction;

      try {
        await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

        int numRetries = 0;
        while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
          numRetries++;
        }
        _setState = PowerState.idle;
      } catch (error) {
        _setErrorState(error.toString());
        await Future.delayed(Duration(seconds: 1))
            .then((_) => _setState = PowerState.idle);
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

  set _setState(PowerState newState) {
    _currentState = newState;
    notifyListeners();
  }

  void _setErrorState(String errorMsg) {
    setErrorMessage = errorMsg;
    _currentState = PowerState.error;
    notifyListeners();
  }

  bool get isBusy => (_currentState == PowerState.loading ||
      _currentState == PowerState.performingAction);

  bool get isLoading => _currentState == PowerState.loading;

  bool get isPerformingAction => _currentState == PowerState.performingAction;

  bool get isInErrorState => _currentState == PowerState.error;

  set setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  String get getErrorMessage => _latestErrorMsg;
}
