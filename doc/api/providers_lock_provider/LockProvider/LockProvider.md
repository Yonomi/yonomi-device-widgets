


# LockProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../../providers_lock_provider/GetLockDetailsFunction.md) getLockDetails = DevicesRepository.getLockDetails})





## Implementation

```dart
LockProvider(Request request, String deviceId,
    {GetLockDetailsFunction getLockDetails =
        DevicesRepository.getLockDetails}) {
  _request = request;
  getDeviceDetail(deviceId, getLockDetails: getLockDetails);
}
```







