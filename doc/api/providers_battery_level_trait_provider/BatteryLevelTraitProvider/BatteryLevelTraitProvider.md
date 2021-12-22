


# BatteryLevelTraitProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BatteryLevelTraitProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
BatteryLevelTraitProvider(Request request, String deviceId,
    {GetDeviceDetailsMethod getDetails =
        DevicesRepository.getDeviceDetails}) {
  this._deviceId = deviceId;
  this._request = request;
  fetchData(getDeviceDetails: getDetails);
}
```







