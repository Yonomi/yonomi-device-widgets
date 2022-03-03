


# setThermostatMode method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setThermostatMode
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html) mode, {[SetModeFunction](../../providers_thermostat_provider/SetModeFunction.md) setMode = ThermostatRepository.setMode})








## Implementation

```dart
Future<void> setThermostatMode(String deviceId, AvailableThermostatMode mode,
    {SetModeFunction setMode = ThermostatRepository.setMode}) async {
  return performAction(
      mode, () => getModeState, () => setMode(_request, deviceId, mode));
}
```







