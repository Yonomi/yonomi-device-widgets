


# setFanMode method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setFanMode
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html) fanMode, {[SetFanModeFunction](../../providers_thermostat_provider/SetFanModeFunction.md) setFanMode = ThermostatRepository.setFanMode})








## Implementation

```dart
Future<void> setFanMode(String deviceId, AvailableFanMode fanMode,
    {SetFanModeFunction setFanMode = ThermostatRepository.setFanMode}) async {
  return performAction(fanMode, () => getFanModeState,
      () => setFanMode(_request, deviceId, fanMode));
}
```







