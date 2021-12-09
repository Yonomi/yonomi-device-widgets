


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Device](https://yonomi.co/yonomi-sdk/Device-class.html)?> fetchData
({[GetDetailsFunction](../../providers_trait_detail_provider/GetDetailsFunction.md) getDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<Device?> fetchData(
    {GetDetailsFunction getDetails =
        DevicesRepository.getDeviceDetails}) async {
  setLoading = true;

  _deviceDetail = await getDetails(_request, _deviceId);
  setLoading = false;

  return _deviceDetail;
}
```







