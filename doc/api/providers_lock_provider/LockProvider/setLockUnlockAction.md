


# setLockUnlockAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setLockUnlockAction
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setLock, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendLockUnlockFunction](../../providers_lock_provider/SendLockUnlockFunction.md) sendLockUnlock = LockRepository.sendLockUnlockAction})








## Implementation

```dart
Future<void> setLockUnlockAction(String deviceId, bool setLock,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
    SendLockUnlockFunction sendLockUnlock =
        LockRepository.sendLockUnlockAction}) async {
  return performAction<bool>(
      isLocked, setLock, () => sendLockUnlock(_request, deviceId, setLock),
      getDetails: getDetails);
}
```







