


# PowerTraitProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



PowerTraitProvider(@[required](https://pub.dev/documentation/meta/1.7.0/meta/required-constant.html) [Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, @[required](https://pub.dev/documentation/meta/1.7.0/meta/required-constant.html) [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
PowerTraitProvider(
  @required Request request,
  @required String deviceId, {
  GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
}) {
  _request = request;
  _deviceId = deviceId;
  fetchData(getDeviceDetails: getDetails);
}
```







