


# DeviceProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



DeviceProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = sdk.DevicesRepository.getDeviceDetails})





## Implementation

```dart
DeviceProvider(sdk.Request request, String deviceId,
    {GetDeviceDetailsMethod getDetails =
        sdk.DevicesRepository.getDeviceDetails}) {
  this._deviceId = deviceId;
  this._request = request;
  fetchData(getDetails: getDetails);
}
```







