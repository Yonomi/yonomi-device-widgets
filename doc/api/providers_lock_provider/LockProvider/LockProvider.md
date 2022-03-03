


# LockProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
LockProvider(Request request, String deviceId,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
    : super(request, deviceId, getDetails: getDetails) {
  this._request = request;
}
```







