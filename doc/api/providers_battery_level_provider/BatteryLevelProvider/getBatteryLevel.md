


# getBatteryLevel property




    *[<Null safety>](https://dart.dev/null-safety)*




[int](https://api.flutter.dev/flutter/dart-core/int-class.html) getBatteryLevel
  







## Implementation

```dart
int get getBatteryLevel {
  return state<BatteryLevelTrait, BatteryLevel>()?.value ?? 0;
}
```








