


# getBatteryLevelState property




    *[<Null safety>](https://dart.dev/null-safety)*




[int](https://api.flutter.dev/flutter/dart-core/int-class.html) getBatteryLevelState
  







## Implementation

```dart
int get getBatteryLevelState {
  return state<BatteryLevelTrait, BatteryLevel>()?.value ?? 0;
}
```








