


# Arc constructor







Arc({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html) key, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showThumb = true, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) centerWidget, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [double](https://api.flutter.dev/flutter/dart-core/double-class.html) initialValue, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [double](https://api.flutter.dev/flutter/dart-core/double-class.html) maxValue, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [ValueChanged](https://api.flutter.dev/flutter/foundation/ValueChanged.html)&lt;[double](https://api.flutter.dev/flutter/dart-core/double-class.html)> onFinalSetPoint, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) color})





## Implementation

```dart
Arc({
  Key key,
  this.showThumb = true,
  @required this.centerWidget,
  @required this.initialValue,
  @required this.maxValue,
  @required this.onFinalSetPoint,
  this.color,
}) : super(key: key);
```







