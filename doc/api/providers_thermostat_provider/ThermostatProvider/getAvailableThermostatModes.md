


# getAvailableThermostatModes property




    *[<Null safety>](https://dart.dev/null-safety)*




[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;[AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html)> getAvailableThermostatModes
  







## Implementation

```dart
Set<AvailableThermostatMode> get getAvailableThermostatModes {
  return getThermostatTrait()?.availableThermostatModes ?? {};
}
```








