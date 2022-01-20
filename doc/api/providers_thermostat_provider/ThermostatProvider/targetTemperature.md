


# targetTemperature property




    *[<Null safety>](https://dart.dev/null-safety)*




[double](https://api.flutter.dev/flutter/dart-core/double-class.html) targetTemperature
  







## Implementation

```dart
double get targetTemperature => getThermostatTraits()
    .firstWhere((trait) => trait.state is TargetTemperature,
        orElse: () => ThermostatTrait(TargetTemperature(0.0)))
    .state
    .value;
```








