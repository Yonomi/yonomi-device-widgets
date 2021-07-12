


# setThermostatMode method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setThermostatMode
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [ThermostatMode](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/graphql_devices_thermostat_thermostat_queries.graphql/ThermostatMode-class.html) mode, {[SetModeFunction](../../providers_thermostat_provider/SetModeFunction.md) injectSetModeMethod})








## Implementation

```dart
Future<void> setThermostatMode(String deviceId, ThermostatMode mode,
    {SetModeFunction injectSetModeMethod}) async {
  final setModeMethod = injectSetModeMethod ?? ThermostatRepository.setMode;
  setModeMethod(_request, deviceId, mode);
}
```







