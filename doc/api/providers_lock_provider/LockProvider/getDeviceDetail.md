


# getDeviceDetail method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDeviceDetail
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod})








## Implementation

```dart
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
```







