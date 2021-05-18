import 'package:flutter/cupertino.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/repository/devices/lock_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class LockProvider extends ChangeNotifier {
  bool loading = false;

  LockProvider(Request request, String deviceId) {
    _request = request;
    getDeviceDetail(deviceId);
  }

  Request _request;
  Device _deviceDetail;

  Device get deviceDetail => _deviceDetail;

  bool get isLocked => _deviceDetail?.traits?.first?.state?.value ?? false;

  Future<void> getDeviceDetail(String deviceId) async {
    loading = true;
    _deviceDetail = await DevicesRepository.getLockDetails(_request, deviceId);

    loading = false;
    notifyListeners();
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock) async {
    await LockRepository.sendLockUnlockAction(_request, deviceId, setLock);
  }
}
