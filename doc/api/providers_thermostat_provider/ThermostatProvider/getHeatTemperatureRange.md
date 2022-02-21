


# getHeatTemperatureRange property




    *[<Null safety>](https://dart.dev/null-safety)*




[TemperatureRange](https://yonomi.co/yonomi-sdk/TemperatureRange-class.html)? getHeatTemperatureRange
  







## Implementation

```dart
TemperatureRange? get getHeatTemperatureRange =>
    getThermostatTrait()?.propertyWhereType<HeatSetPointRange>().value;
```








