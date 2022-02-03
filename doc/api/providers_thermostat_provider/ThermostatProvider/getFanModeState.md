


# getFanModeState property




    *[<Null safety>](https://dart.dev/null-safety)*




[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getFanModeState
  







## Implementation

```dart
String get getFanModeState {
  return getThermostatTrait()?.stateWhereType<FanMode>().value;
}
```








