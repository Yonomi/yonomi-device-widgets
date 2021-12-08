import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDetailsFunction = Future<Device> Function(
    Request request, String id);

class TraitBasedDeviceNotifier extends ChangeNotifier {
  bool _loadingDetail = false;

  late String _deviceId;

  late Request _request;

  Device? _deviceDetail;

  Device? get deviceDetail => _deviceDetail;

  set deviceDetail(Device? detail) {
    _deviceDetail = detail;
    notifyListeners();
  }

  TraitBasedDeviceNotifier(Request request, String deviceId,
      {GetDetailsFunction getDetails = DevicesRepository.getDeviceDetails}) {
    _request = request;
    _deviceId = deviceId;
    fetchData(getDetails: getDetails);
  }

  Future<Device?> fetchData(
      {GetDetailsFunction getDetails =
          DevicesRepository.getDeviceDetails}) async {
    setLoading = true;

    _deviceDetail = await getDetails(_request, _deviceId);
    setLoading = false;

    return _deviceDetail;
  }

  set setLoading(bool newLoading) {
    _loadingDetail = newLoading;
    notifyListeners();
  }

  bool get isLoading => _loadingDetail;
}
