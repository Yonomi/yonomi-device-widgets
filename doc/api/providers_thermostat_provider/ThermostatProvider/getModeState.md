


# getModeState property




    *[<Null safety>](https://dart.dev/null-safety)*




[AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html) getModeState
  







## Implementation

```dart
AvailableThermostatMode get getModeState {
  return getThermostatTrait()?.stateWhereType<ThermostatMode>()?.value ??
      AvailableThermostatMode.OFF;
}
```








