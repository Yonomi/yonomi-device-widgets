


# getSectionsCoordinatesInCircle function










[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html)> getSectionsCoordinatesInCircle
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) center, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) radius, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) sections)






## Implementation

```dart
List<Offset> getSectionsCoordinatesInCircle(
    Offset center, double radius, int sections) {
  var intervalAngle = (pi * 2) / sections;
  return List<int>.generate(sections, (int index) => index).map((i) {
    var radians = (pi / 2) + (intervalAngle * i);
    return radiansToCoordinates(center, radians, radius);
  }).toList();
}
```







