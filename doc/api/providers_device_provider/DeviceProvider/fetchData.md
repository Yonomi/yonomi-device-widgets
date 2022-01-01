


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Device](https://yonomi.co/yonomi-sdk/Device-class.html)?> fetchData
({[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<Device?> fetchData(
    {GetDeviceDetailsMethod getDetails =
        DevicesRepository.getDeviceDetails}) async {
  setState = WidgetState.loading;

  try {
    _deviceDetail = await getDetails(_request, _deviceId);
    setState = WidgetState.idle;
  } catch (error) {
    setErrorState(error.toString());
    return null;
  }

  return _deviceDetail;
}
```







