


# getCoolTemperatureRange property




    *[<Null safety>](https://dart.dev/null-safety)*




[TemperatureRange](https://yonomi.co/yonomi-sdk/TemperatureRange-class.html)? getCoolTemperatureRange
  







## Implementation

```dart
TemperatureRange? get getCoolTemperatureRange =>
    getThermostatTrait()?.propertyWhereType<CoolSetPointRange>().value;
```








