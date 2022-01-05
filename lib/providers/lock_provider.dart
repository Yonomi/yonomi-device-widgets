import 'package:flutter/widgets.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetLockDetailsFunction = Future<Device> Function(
    Request request, String id);

typedef SendLockUnlockFunction = Future<void> Function(
    Request request, String id, bool lockUnlock);

class LockProvider extends ChangeNotifier {
  bool loadingDetail = false;
  bool loadingAction = false;

  static const int _MAX_RETRIES = 10;

  LockProvider(Request request, String deviceId,
      {GetLockDetailsFunction getLockDetails =
          DevicesRepository.getLockDetails}) {
    _request = request;
    getDeviceDetail(deviceId, getLockDetails: getLockDetails);
  }

  late Request _request;
  late Device _deviceDetail;

  Device get deviceDetail => _deviceDetail;

  bool get isLocked => getLockTrait().state.value;

  LockTrait getLockTrait() {
    return _deviceDetail.traits
        .skipWhile((trait) => !(trait is LockTrait))
        .first as LockTrait;
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

      int numRetries = 0;
      while (
          getLockTrait().state.value != setLock && numRetries < _MAX_RETRIES) {
        // Wait more time
        _deviceDetail = await lockDetails(_request, deviceId);
        await Future.delayed(Duration(milliseconds: 750));
        numRetries++;
      }

      loadingAction = false;
      notifyListeners();
    }
  }
}
