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

  PowerState currentState = PowerState.idle;
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
    setState = PowerState.loading;

    try {
      this.deviceDetail = await getDeviceDetails(_request, _deviceId);
    } catch (error) {
      setErrorMessage = error.toString();
      setState = PowerState.error;
      return null;
    }

    return deviceDetail;
  }

  Future<void> sendPowerOnOffAction(bool desiredOnOffState,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    if (currentState != PowerState.performingAction) {
      setState = PowerState.performingAction;

      try {
        await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

        int numRetries = 0;
        while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
          numRetries++;
        }
        setState = PowerState.idle;
      } catch (error) {
        setErrorMessage = error.toString();
        setState = PowerState.error;
        await Future.delayed(Duration(seconds: 1))
            .then((_) => setState = PowerState.idle);
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

  set deviceDetail(Device? detail) {
    _deviceDetail = detail;

    setState = PowerState.idle;
  }

  bool get getOnOffState {
    return getPowerTrait()?.state.value ?? false;
  }

  set setState(PowerState newState) {
    this.currentState = newState;
    notifyListeners();
  }

  bool get isBusy => (currentState == PowerState.loading ||
      currentState == PowerState.performingAction);

  bool get isLoading => currentState == PowerState.loading;

  bool get isPerformingAction => currentState == PowerState.performingAction;

  bool get isInErrorState => currentState == PowerState.error;

  set setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  String get getErrorMessage => _latestErrorMsg;
}
