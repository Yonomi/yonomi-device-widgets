


# isAngleInsideRadiansSelection function










[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isAngleInsideRadiansSelection
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) angle, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) start, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) sweep)






## Implementation

```dart
bool isAngleInsideRadiansSelection(double angle, double start, double sweep) {
  var normalized = angle > pi / 2 ? 5 * pi / 2 - angle : pi / 2 - angle;
  var end = (start + sweep) % (2 * pi);
  return end > start
      ? normalized > start && normalized < end
      : normalized > start || normalized < end;
}
```







