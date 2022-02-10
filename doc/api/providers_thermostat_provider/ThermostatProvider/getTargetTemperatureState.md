


# getTargetTemperatureState property




    *[<Null safety>](https://dart.dev/null-safety)*




[double](https://api.flutter.dev/flutter/dart-core/double-class.html) getTargetTemperatureState
  







## Implementation

```dart
double get getTargetTemperatureState =>
    getThermostatTrait()?.stateWhereType<TargetTemperature>().value ?? 0.0;
```








