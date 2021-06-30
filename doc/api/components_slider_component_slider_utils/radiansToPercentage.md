


# radiansToPercentage function










[double](https://api.flutter.dev/flutter/dart-core/double-class.html) radiansToPercentage
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) radians, {[double](https://api.flutter.dev/flutter/dart-core/double-class.html) startAngle, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) sweepAngle})






## Implementation

```dart
double radiansToPercentage(double radians,
    {double startAngle, double sweepAngle}) {
  // Rotate angles so that zero starts at bottom
  // radians = (radians + (pi / 2)) % (2 * pi);
  // startAngle = (startAngle - (pi / 2)) % (2 * pi);

  // Find angle of the cutout
  var arcAngle = ((2 * pi - (sweepAngle))) % (2 * pi);

  // If selected below minimum range, set to minimum selectable angle
  if (radians >= startAngle)
    radians = radians - startAngle;
  else
    radians = 0;

  // If selected above maximum range, set to maximum selectable angle
  if (radians >= (2 * pi - arcAngle)) {
    radians = (2 * pi - arcAngle);
  }

  // Calculate percentage by subtracting cutout angle from the
  // amount in a regular circle.
  var total_calculable_circle = 2 * pi - arcAngle;

  var percentage = ((100 * radians) / total_calculable_circle);
  return (percentage) % 100;
}
```







