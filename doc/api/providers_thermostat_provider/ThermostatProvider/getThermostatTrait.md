


# getThermostatTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[ThermostatTrait](https://yonomi.co/yonomi-sdk/ThermostatTrait-class.html)? getThermostatTrait
()








## Implementation

```dart
ThermostatTrait? getThermostatTrait() {
  return _deviceDetail?.traits.first as ThermostatTrait?;
}
```







