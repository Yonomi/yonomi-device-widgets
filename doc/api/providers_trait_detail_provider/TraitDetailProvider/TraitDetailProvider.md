


# TraitDetailProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



TraitDetailProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDetailsFunction](../../providers_trait_detail_provider/GetDetailsFunction.md) getDetails = DevicesRepository.getDeviceDetails})





## Implementation

```dart
TraitDetailProvider(Request request, String deviceId,
    {GetDetailsFunction getDetails = DevicesRepository.getDeviceDetails})
    : super(request, deviceId) {
  fetchData(getDetails: getDetails);
}
```







