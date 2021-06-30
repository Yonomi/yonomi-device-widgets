


# isPointInsideCircle function










[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isPointInsideCircle
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) point, [Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) center, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) rradius)






## Implementation

```dart
bool isPointInsideCircle(Offset point, Offset center, double rradius) {
  var radius = rradius * 1.2;
  return point.dx < (center.dx + radius) &&
      point.dx > (center.dx - radius) &&
      point.dy < (center.dy + radius) &&
      point.dy > (center.dy - radius);
}
```







