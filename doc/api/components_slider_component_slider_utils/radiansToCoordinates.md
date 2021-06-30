


# radiansToCoordinates function










[Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) radiansToCoordinates
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) center, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) radians, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) radius)






## Implementation

```dart
Offset radiansToCoordinates(Offset center, double radians, double radius) {
  var dx = center.dx + radius * cos(radians);
  var dy = center.dy + radius * sin(radians);
  return Offset(dx, dy);
}
```







