import 'package:flutter/cupertino.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class LockProvider extends ChangeNotifier {
  LockProvider(Request request, String deviceId) {
    _request = request;
    getDeviceDetail(deviceId);
  }

  Request _request;
  Device _deviceDetail;

  Device get deviceDetail => _deviceDetail;

  Future<void> getDeviceDetail(String deviceId) async {
    _deviceDetail = await DevicesRepository.getLockDetails(_request, deviceId);
    notifyListeners();
  }
}