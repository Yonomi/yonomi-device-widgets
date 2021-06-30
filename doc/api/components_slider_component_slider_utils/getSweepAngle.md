


# getSweepAngle function










[double](https://api.flutter.dev/flutter/dart-core/double-class.html) getSweepAngle
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) init, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) end)






## Implementation

```dart
double getSweepAngle(double init, double end) {
  if (end > init) {
    return end - init;
  }
  return (100 - init + end).abs();
}
```







