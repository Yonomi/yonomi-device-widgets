


# getAmbientTemperatureState property




    *[<Null safety>](https://dart.dev/null-safety)*




[double](https://api.flutter.dev/flutter/dart-core/double-class.html) getAmbientTemperatureState
  







## Implementation

```dart
double get getAmbientTemperatureState =>
    getThermostatTrait()?.stateWhereType<AmbientTemperature>().value ?? 0.0;
```








