


# Arc constructor




    *[<Null safety>](https://dart.dev/null-safety)*



Arc({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showThumb = true, required [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) centerWidget, required [double](https://api.flutter.dev/flutter/dart-core/double-class.html) initialValue, required [double](https://api.flutter.dev/flutter/dart-core/double-class.html) maxValue, required [ValueChanged](https://api.flutter.dev/flutter/foundation/ValueChanged.html)&lt;[double](https://api.flutter.dev/flutter/dart-core/double-class.html)> onFinalSetPoint, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? color})





## Implementation

```dart
Arc({
  Key? key,
  this.showThumb = true,
  required this.centerWidget,
  required this.initialValue,
  required this.maxValue,
  required this.onFinalSetPoint,
  this.color,
}) : super(key: key);
```







