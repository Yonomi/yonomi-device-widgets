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

    return _deviceDetail;
  }

  Future<void> sendPowerOnOffAction(bool setOnOff,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    if (!isPerformingAction) {
      setPerformingAction = true;

      try {
        await sendPowerMethod(_request, this._deviceId, setOnOff);

        int numRetries = 0;
        while (getPowerTrait()?.state.value != setOnOff &&
            numRetries < MAX_RETRIES) {
          _deviceDetail = await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: 750));
          numRetries++;
        }
        setPerformingAction = false;
      } catch (error) {
        setErrorState = true;
        Future.delayed(Duration(seconds: 1)).then((_) => setErrorState = false);
      }
    }
  }

  PowerTrait? getPowerTrait() {
    return _deviceDetail?.traits.first as PowerTrait?;
  }

  set setLoading(bool newIsLoading) {
    _isPerformingAction = false;
    _isLoading = newIsLoading;
    _isInErrorState = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set setPerformingAction(bool newIsPerformingAction) {
    _isPerformingAction = newIsPerformingAction;
    _isLoading = false;
    _isInErrorState = false;
    notifyListeners();
  }

  bool get isPerformingAction => _isPerformingAction;

  set setErrorState(bool newIsError) {
    _isInErrorState = newIsError;
    _isLoading = false;
    _isPerformingAction = false;
    notifyListeners();
  }

  bool get isInErrorState => _isInErrorState;
}
