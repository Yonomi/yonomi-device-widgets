import 'package:flutter/widgets.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDeviceDetails = Future<Device> Function(
    Request request, String deviceId);

abstract class DeviceProvider extends ChangeNotifier {
  bool loadingDetail = false;
  bool loadingAction = false;

  late Request _request;
  late Device _deviceDetails;

  Device get deviceDetails => _deviceDetails;
  Request get request => _request;

  DeviceProvider(Request request, String deviceId,
      {GetDeviceDetails getDetails = DevicesRepository.getDeviceDetails}) {
    this._request = request;
    getDeviceDetails(deviceId, getDetails: getDetails);
  }

  Future<void> getDeviceDetails(String deviceId,
      {GetDeviceDetails getDetails =
          DevicesRepository.getDeviceDetails}) async {
    loadingDetail = true;
    notifyListeners();

    _deviceDetails = await getDetails(_request, deviceId);

    loadingDetail = false;
    notifyListeners();
  }
}
