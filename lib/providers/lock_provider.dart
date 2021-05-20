import 'package:flutter/cupertino.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/repository/devices/lock_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class LockProvider extends ChangeNotifier {
  bool loadingDetail = false;
  bool loadingAction = false;

  LockProvider(Request request, String deviceId) {
    _request = request;
    getDeviceDetail(deviceId);
  }

  Request _request;
  Device _deviceDetail;

  Device get deviceDetail => _deviceDetail;

  bool get isLocked => _deviceDetail?.traits?.first?.state?.value ?? false;

  Future<void> getDeviceDetail(String deviceId) async {
    loadingDetail = true;

    notifyListeners();

    _deviceDetail = await DevicesRepository.getLockDetails(_request, deviceId);

    loadingDetail = false;

    notifyListeners();
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock) async {
    loadingAction = true;

    notifyListeners();

    await LockRepository.sendLockUnlockAction(_request, deviceId, setLock);

    var maxRetries = 0;
    while (_deviceDetail?.traits?.first?.state?.value != setLock &&
        maxRetries < 10) {
      // Wait more time
      _deviceDetail =
          await DevicesRepository.getLockDetails(_request, deviceId);
      await Future.delayed(Duration(milliseconds: 750));
      maxRetries++;
    }
    loadingAction = false;

    notifyListeners();
  }
}
