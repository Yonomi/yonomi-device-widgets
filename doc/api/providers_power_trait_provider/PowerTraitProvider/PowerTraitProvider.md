


# PowerTraitProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



PowerTraitProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
PowerTraitProvider(
  Request request,
  String deviceId, {
  GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
}) {
  _request = request;
  _deviceId = deviceId;
  fetchData(getDeviceDetails: getDetails);
}
```







