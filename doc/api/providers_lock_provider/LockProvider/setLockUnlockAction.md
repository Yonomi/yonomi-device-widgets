


# setLockUnlockAction method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setLockUnlockAction
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setLock, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod, [SendLockUnlockFunction](../../providers_lock_provider/SendLockUnlockFunction.md) injectSendLockUnlockMethod})








## Implementation

```dart
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
```







