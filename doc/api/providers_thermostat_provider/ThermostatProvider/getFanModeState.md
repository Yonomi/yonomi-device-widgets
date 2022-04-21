


# getFanModeState property




    *[<Null safety>](https://dart.dev/null-safety)*




[AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html) getFanModeState
  







## Implementation

```dart
AvailableFanMode get getFanModeState {
  return getThermostatTrait()?.stateWhereType<FanMode>()?.value;
}
```








