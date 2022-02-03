import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendLockUnlockFunction = Future<void> Function(
    Request request, String id, bool lockUnlock);

class LockProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'LOCK';

  LockProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    this._request = request;
  }

  late final Request _request;

  bool get getIsLockedState => state<LockTrait, IsLocked>()?.value ?? false;

  LockTrait? getLockTrait() {
    return trait<LockTrait>() as LockTrait?;
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendLockUnlockFunction sendLockUnlock =
          LockRepository.sendLockUnlockAction}) async {
    return performAction<bool>(setLock, () => getIsLockedState,
        () => sendLockUnlock(_request, deviceId, setLock),
        getDetails: getDetails);
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
