


# LockProvider constructor







LockProvider([Request](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/request_request/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod})





## Implementation

```dart
LockProvider(Request request, String deviceId,
    {GetLockDetailsFunction injectLockDetailsMethod}) {
  _request = request;
  getDeviceDetail(deviceId, injectLockDetailsMethod: injectLockDetailsMethod);
}
```







