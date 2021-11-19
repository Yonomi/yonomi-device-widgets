


# getDeviceDetail method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDeviceDetail
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetThermostatDetailsFunction](../../providers_thermostat_provider/GetThermostatDetailsFunction.md) getThermostatDetails = DevicesRepository.getThermostatDetails})








## Implementation

```dart
Future<void> getDeviceDetail(String deviceId,
    {GetThermostatDetailsFunction getThermostatDetails =
        DevicesRepository.getThermostatDetails}) async {
  _deviceDetail = await getThermostatDetails(_request, deviceId);
  notifyListeners();
}
```







