


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
  if (!isPerformingAction) {
    setState = WidgetState.performingAction;

    try {
      await sendLockUnlock(_request, deviceId, setLock);

      int numRetries = 0;
      while (getLockTrait()?.state.value != setLock &&
          numRetries < _MAX_RETRIES) {
        // Wait more time
        await getDetails(_request, deviceId);
        await Future.delayed(Duration(milliseconds: 750));
        numRetries++;
      }

      setState = WidgetState.idle;
    } catch (error) {
      setErrorState(error.toString());
      await Future.delayed(Duration(seconds: 1))
          .then((_) => setState = WidgetState.idle);
    }
  }
}
```







