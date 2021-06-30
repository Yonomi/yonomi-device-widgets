


# isPointAlongCircle function










[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isPointAlongCircle
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) point, [Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) center, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) radius)






## Implementation

```dart
bool isPointAlongCircle(Offset point, Offset center, double radius) {
  // distance is root(sqr(x2 - x1) + sqr(y2 - y1))
  // i.e., (7,8) and (3,2) -> 7.21
  var d1 = pow(point.dx - center.dx, 2);
  var d2 = pow(point.dy - center.dy, 2);
  var distance = sqrt(d1 + d2);
  return (distance - radius).abs() < 5;
}
```







