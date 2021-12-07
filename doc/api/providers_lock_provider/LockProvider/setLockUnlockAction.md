


# setLockUnlockAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setLockUnlockAction
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setLock, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) lockDetails = DevicesRepository.getLockDetails, [SendLockUnlockFunction](../../providers_lock_provider/SendLockUnlockFunction.md) sendLockUnlock = LockRepository.sendLockUnlockAction})








## Implementation

```dart
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
```







