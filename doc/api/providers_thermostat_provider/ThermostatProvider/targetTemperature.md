


# targetTemperature property




    *[<Null safety>](https://dart.dev/null-safety)*




[double](https://api.flutter.dev/flutter/dart-core/double-class.html) targetTemperature
  







## Implementation

```dart
double get targetTemperature =>
    (getThermostatTrait()?.state as TargetTemperature?)?.value ?? 0.0;
```








