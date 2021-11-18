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
      {GetLockDetailsFunction getLockDetails =
          DevicesRepository.getLockDetails}) {
    _request = request;
    getDeviceDetail(deviceId, getLockDetails: getLockDetails);
  }

  late Request _request;
  Device? _deviceDetail;

  Device? get deviceDetail => _deviceDetail;

  bool get isLocked => getLockTrait()?.state.value ?? false;

  LockTrait? getLockTrait() {
    return _deviceDetail?.traits.first as LockTrait?;
  }

  Future<void> getDeviceDetail(String deviceId,
      {GetLockDetailsFunction getLockDetails =
          DevicesRepository.getLockDetails}) async {
    loadingDetail = true;
    notifyListeners();

    _deviceDetail = await getLockDetails(_request, deviceId);

    loadingDetail = false;
    notifyListeners();
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock,
      {GetLockDetailsFunction lockDetails = DevicesRepository.getLockDetails,
      SendLockUnlockFunction sendLockUnlock =
          LockRepository.sendLockUnlockAction}) async {
    if (!loadingAction) {
      loadingAction = true;

      notifyListeners();

      await sendLockUnlock(_request, deviceId, setLock);

      var maxRetries = 0;
      while (getLockTrait()?.state.value != setLock && maxRetries < 10) {
        print('didnt reach here===========');
        // Wait more time
        _deviceDetail = await lockDetails(_request, deviceId);
        await Future.delayed(Duration(milliseconds: 750));
        maxRetries++;
      }
      loadingAction = false;

      notifyListeners();
    }
  }
}
