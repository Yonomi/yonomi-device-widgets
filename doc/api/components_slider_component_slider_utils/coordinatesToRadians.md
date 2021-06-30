


# coordinatesToRadians function










[double](https://api.flutter.dev/flutter/dart-core/double-class.html) coordinatesToRadians
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) center, [Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) point)






## Implementation

```dart
double coordinatesToRadians(Offset center, Offset point) {
  double a = center.dx - point.dx;
  double b = center.dy - point.dy;
  return ((atan2(b, a) + (pi / 2)) % (2 * pi));
}
```







