import 'package:flutter/cupertino.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetLockDetailsFunction = Future<Device> Function(
    Request request, String id);

typedef SendLockUnlockFunction = Future<void> Function(
    Request request, String id, bool lockUnlock);

class LockProvider extends ChangeNotifier {
  bool loadingDetail = false;
  bool loadingAction = false;

  LockProvider(Request request, String deviceId,
      {GetLockDetailsFunction injectLockDetailsMethod}) {
    _request = request;
    getDeviceDetail(deviceId, injectLockDetailsMethod: injectLockDetailsMethod);
  }

  Request _request;
  Device _deviceDetail;

  Device get deviceDetail => _deviceDetail;

  bool get isLocked => getLockTrait()?.state?.value ?? false;

  LockTrait getLockTrait() {
    return _deviceDetail?.traits?.first;
  }

  Future<void> getDeviceDetail(String deviceId,
      {GetLockDetailsFunction injectLockDetailsMethod}) async {
    final getLockDetailsMethod =
        injectLockDetailsMethod ?? DevicesRepository.getLockDetails;

    loadingDetail = true;
    notifyListeners();

    _deviceDetail = await getLockDetailsMethod(_request, deviceId);

    loadingDetail = false;
    notifyListeners();
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock,
      {GetLockDetailsFunction injectLockDetailsMethod,
      SendLockUnlockFunction injectSendLockUnlockMethod}) async {
    final getLockDetailsMethod =
        injectLockDetailsMethod ?? DevicesRepository.getLockDetails;
    final sendLockUnlockMethod =
        injectSendLockUnlockMethod ?? LockRepository.sendLockUnlockAction;

    if (!loadingAction) {
      loadingAction = true;

      notifyListeners();

      await sendLockUnlockMethod(_request, deviceId, setLock);

      var maxRetries = 0;
      while (getLockTrait()?.state?.value != setLock && maxRetries < 10) {
        // Wait more time
        _deviceDetail = await getLockDetailsMethod(_request, deviceId);
        await Future.delayed(Duration(milliseconds: 750));
        maxRetries++;
      }
      loadingAction = false;

      notifyListeners();
    }
  }
}
