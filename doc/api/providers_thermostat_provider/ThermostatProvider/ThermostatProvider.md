


# ThermostatProvider constructor







ThermostatProvider([Request](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/request_request/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetThermostatDetailsFunction](../../providers_thermostat_provider/GetThermostatDetailsFunction.md) injectGetThermostatDetailsMethod})





## Implementation

```dart
ThermostatProvider(Request request, String deviceId,
    {GetThermostatDetailsFunction injectGetThermostatDetailsMethod}) {
  _request = request;
  getDeviceDetail(deviceId,
      injectGetThermostatDetailsMethod: injectGetThermostatDetailsMethod);
}
```







