


# getDeviceDetail method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDeviceDetail
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) getLockDetails = DevicesRepository.getLockDetails})








## Implementation

```dart
Future<void> getDeviceDetail(String deviceId,
    {GetLockDetailsFunction getLockDetails =
        DevicesRepository.getLockDetails}) async {
  loadingDetail = true;
  notifyListeners();

  _deviceDetail = await getLockDetails(_request, deviceId);

  loadingDetail = false;
  notifyListeners();
}
```







