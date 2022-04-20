


# ColorProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ColorProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendSetColorActionFunction](../../providers_color_provider/SendSetColorActionFunction.md) sendSetColorAction = ColorRepository.sendSetColorAction})





## Implementation

```dart
ColorProvider(
  Request request,
  String deviceId, {
  this.getDetails = DevicesRepository.getDeviceDetails,
  this.sendSetColorAction = ColorRepository.sendSetColorAction,
}) : super(request, deviceId, getDetails: getDetails) {
  this._deviceId = deviceId;
  this._request = request;
}
```







