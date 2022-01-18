


# setPointAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setPointAction
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) temperature, {[SetPointActionFunction](../../providers_thermostat_provider/SetPointActionFunction.md) setPoint = ThermostatRepository.setPointThermostat})








## Implementation

```dart
Future<void> setPointAction(String deviceId, double temperature,
    {SetPointActionFunction setPoint =
        ThermostatRepository.setPointThermostat}) async {
  return performAction<double>(temperature, () => thermostatTargetTemperature,
      () => setPoint(_request, deviceId, temperature));
}
```







