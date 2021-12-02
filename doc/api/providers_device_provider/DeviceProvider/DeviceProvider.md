


# DeviceProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



DeviceProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetails](../../providers_device_provider/GetDeviceDetails.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
DeviceProvider(Request request, String deviceId,
    {GetDeviceDetails getDetails = DevicesRepository.getDeviceDetails}) {
  this._request = request;
  getDeviceDetails(deviceId, getDetails: getDetails);
}
```







