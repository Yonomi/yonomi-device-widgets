import 'package:flutter/cupertino.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/repository/devices/lock_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class LockProvider extends ChangeNotifier {
  bool loadingDetail = false;
  bool loadingAction = false;

  LockProvider(Request request, String deviceId) {
    _request = request;
    _deviceId = deviceId;
  }

  Request _request;
  String _deviceId;

  Device _deviceDetail;

  String get deviceId => _deviceId;

  DevicesRepositoryWrapper _deviceRepo;
  LockRepositoryWrapper _lockRepo;

  Device get deviceDetail => _deviceDetail;

  bool get isLocked => getLockTrait()?.state?.value ?? false;

  LockUnlockTrait getLockTrait() {
    return _deviceDetail?.traits?.first;
  }

  Future<void> getDeviceDetail({String deviceId}) async {
    loadingDetail = true;
    notifyListeners();

    _deviceDetail =
        await _deviceRepo.getLockDetails(_request, deviceId ?? _deviceId);

    loadingDetail = false;
    notifyListeners();
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock) async {
    if (!loadingAction) {
      loadingAction = true;

      notifyListeners();

      await _lockRepo.sendLockUnlockAction(_request, deviceId, setLock);

      var maxRetries = 0;
      while (getLockTrait()?.state?.value != setLock && maxRetries < 10) {
        // Wait more time
        _deviceDetail = await _deviceRepo.getLockDetails(_request, deviceId);
        await Future.delayed(Duration(milliseconds: 750));
        maxRetries++;
      }
      loadingAction = false;

      notifyListeners();
    }
  }

  void set deviceRepo(DevicesRepositoryWrapper devicesRepo) {
    _deviceRepo = devicesRepo;
  }

  void set lockRepo(LockRepositoryWrapper lockRepo) {
    _lockRepo = lockRepo;
  }
}

class DevicesRepositoryWrapper {
  Future<Device> getLockDetails(Request _request, String deviceId) {
    return DevicesRepository.getLockDetails(_request, deviceId);
  }
}

class LockRepositoryWrapper {
  Future<void> sendLockUnlockAction(
      Request _request, String deviceId, bool setLock) {
    return LockRepository.sendLockUnlockAction(_request, deviceId, setLock);
  }
}
