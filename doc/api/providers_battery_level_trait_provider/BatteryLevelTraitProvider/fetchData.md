


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Device](https://yonomi.co/yonomi-sdk/Device-class.html)?> fetchData
({[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDeviceDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<Device?> fetchData(
    {GetDeviceDetailsMethod getDeviceDetails =
        DevicesRepository.getDeviceDetails}) async {
  _setState = WidgetState.loading;

  try {
    _deviceDetail = await getDeviceDetails(_request, _deviceId);
    _setState = WidgetState.idle;
  } catch (error) {
    _setErrorState(error.toString());
    return null;
  }

  return deviceDetail;
}
```







