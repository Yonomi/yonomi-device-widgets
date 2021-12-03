import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDetailsFunction = Future<Device> Function(
    Request request, String id);

class TraitBasedDeviceNotifier extends ChangeNotifier {
  bool loadingDetail = false;

  late String _deviceId;

  late Request _request;

  Device? _deviceDetail;

  Device? get deviceDetail => _deviceDetail;

  set deviceDetail(Device? detail) {
    _deviceDetail = detail;
    notifyListeners();
  }

  TraitBasedDeviceNotifier(Request request, String deviceId,
      {GetDetailsFunction getDetails = DevicesRepository.getLockDetails}) {
    _request = request;
    _deviceId = deviceId;
    fetchData(getDetails: getDetails);
  }

  Future<Device?> fetchData(
      {GetDetailsFunction getDetails =
          DevicesRepository.getLockDetails}) async {
    loadingDetail = true;
    notifyListeners();

    _deviceDetail = await getDetails(_request, _deviceId);

    loadingDetail = false;
    notifyListeners();

    return _deviceDetail;
  }
}
