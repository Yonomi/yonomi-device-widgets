


# TraitBasedDeviceNotifier constructor




    *[<Null safety>](https://dart.dev/null-safety)*



TraitBasedDeviceNotifier([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDetailsFunction](../../providers_trait_based_device_notifier/GetDetailsFunction.md) getDetails = DevicesRepository.getLockDetails})





## Implementation

```dart
TraitBasedDeviceNotifier(Request request, String deviceId,
    {GetDetailsFunction getDetails = DevicesRepository.getLockDetails}) {
  _request = request;
  _deviceId = deviceId;
  fetchData(getDetails: getDetails);
}
```







