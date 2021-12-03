


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Device](https://yonomi.co/yonomi-sdk/Device-class.html)?> fetchData
({[GetDetailsFunction](../../providers_trait_based_device_notifier/GetDetailsFunction.md) getDetails = DevicesRepository.getLockDetails})








## Implementation

```dart
Future<Device?> fetchData(
    {GetDetailsFunction getDetails =
        DevicesRepository.getLockDetails}) async {
  loadingDetail = true;
  notifyListeners();

  _deviceDetail = await getDetails(_request, _deviceId);

  loadingDetail = false;
  notifyListeners();

  return _deviceDetail;
}
```







