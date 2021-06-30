


# getDeviceDetail method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDeviceDetail
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetThermostatDetailsFunction](../../providers_thermostat_provider/GetThermostatDetailsFunction.md) injectGetThermostatDetailsMethod})








## Implementation

```dart
Future<void> getDeviceDetail(String deviceId,
    {GetThermostatDetailsFunction injectGetThermostatDetailsMethod}) async {
  final getThermostatDetailsMethod = injectGetThermostatDetailsMethod ??
      DevicesRepository.getThermostatDetails;
  _deviceDetail = await getThermostatDetailsMethod(_request, deviceId);
  notifyListeners();
}
```







