


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchData
({[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<void> fetchData(
    {GetDeviceDetailsMethod getDetails =
        DevicesRepository.getDeviceDetails}) async {
  setState = WidgetState.loading;

  try {
    _deviceDetail = await getDetails(_request, _deviceId);
    setState = WidgetState.idle;
  } catch (error) {
    setErrorState(error.toString());
  }
}
```







