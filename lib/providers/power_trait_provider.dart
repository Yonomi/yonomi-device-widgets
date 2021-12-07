import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/traits/trait_based_device_screen.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDeviceDetailsMethod = Future<Device> Function(
    Request request, String id);

typedef SendPowerMethod = Future<void> Function(
    Request request, String id, bool onOff);

class PowerTraitProvider extends ChangeNotifier {
  final int MAX_RETRIES = 10;

  bool _isLoading = false;
  bool _isPerformingAction = false;
  bool _isInErrorState = false;
  String _latestErrorMsg = "An error occurred.";

  late String _deviceId;

  late Request _request;

  Device? _deviceDetail;

  Device? get deviceDetail => _deviceDetail;

  set deviceDetail(Device? detail) {
    _deviceDetail = detail;

    setLoading = false;
  }

  PowerTraitProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails =
          DevicesRepository.getDeviceDetails}) {
    _request = request;
    _deviceId = deviceId;
    fetchData(getDeviceDetails: getDetails);
  }

  Future<Device?> fetchData(
      {GetDeviceDetailsMethod getDeviceDetails =
          DevicesRepository.getDeviceDetails}) async {
    setLoading = true;

    this.deviceDetail = await getDeviceDetails(_request, _deviceId);

    return deviceDetail;
  }

  Future<void> sendPowerOnOffAction(bool desiredOnOffState,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    if (!isPerformingAction) {
      setPerformingAction = true;

      try {
        await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

        int numRetries = 0;
        while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: 750));
          numRetries++;
        }
        setPerformingAction = false;
      } catch (error) {
        setErrorMessage = error.toString();
        setErrorState = true;
        Future.delayed(Duration(seconds: 1)).then((_) => setErrorState = false);
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

  bool get getOnOffState {
    return getPowerTrait()?.state.value ?? false;
  }

  bool get isBusy => isLoading || isPerformingAction;

  set setLoading(bool setIsLoading) {
    _isLoading = setIsLoading;
    _isPerformingAction = false;
    _isInErrorState = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set setPerformingAction(bool setIsPerformingAction) {
    _isPerformingAction = setIsPerformingAction;
    _isLoading = false;
    _isInErrorState = false;
    notifyListeners();
  }

  bool get isPerformingAction => _isPerformingAction;

  set setErrorState(bool setIsError) {
    _isInErrorState = setIsError;
    _isLoading = false;
    _isPerformingAction = false;
    notifyListeners();
  }

  bool get isInErrorState => _isInErrorState;

  set setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  String get getErrorMessage => _latestErrorMsg;
}
