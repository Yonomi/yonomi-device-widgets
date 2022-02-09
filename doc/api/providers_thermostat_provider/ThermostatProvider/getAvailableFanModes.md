


# getAvailableFanModes property




    *[<Null safety>](https://dart.dev/null-safety)*




[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;[AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html)> getAvailableFanModes
  







## Implementation

```dart
Set<AvailableFanMode> get getAvailableFanModes {
  return getThermostatTrait()?.availableFanModes ?? {};
}
```








