


# fetchData method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchData
({[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDeviceDetails = DevicesRepository.getDeviceDetails})





<p>Fetches device data. When loaded, get the data with <code>getDeviceDetails</code></p>
<p>@throws ServerException for any errors returned by the platform</p>



## Implementation

```dart
Future<void> fetchData(
    {GetDeviceDetailsMethod getDeviceDetails =
        DevicesRepository.getDeviceDetails}) async {
  _setState = WidgetState.loading;

  try {
    _deviceDetail = await getDeviceDetails(_request, _deviceId);
    _setState = WidgetState.idle;
  } catch (error) {
    _setErrorState(error.toString());
  }
}
```







