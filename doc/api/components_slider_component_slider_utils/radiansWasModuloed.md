


# radiansWasModuloed function










[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) radiansWasModuloed
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) current, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) previous)






## Implementation

```dart
bool radiansWasModuloed(double current, double previous) {
  return (previous - current).abs() > (3 * pi / 2);
}
```







