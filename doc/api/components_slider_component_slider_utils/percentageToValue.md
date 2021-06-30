


# percentageToValue function










[int](https://api.flutter.dev/flutter/dart-core/int-class.html) percentageToValue
([double](https://api.flutter.dev/flutter/dart-core/double-class.html) percentage, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) intervals)






## Implementation

```dart
int percentageToValue(double percentage, int intervals) =>
    ((percentage * intervals) / 100).round();
```







