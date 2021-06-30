


# toStringShort method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[String](https://api.flutter.dev/flutter/dart-core/String-class.html) toStringShort
()

_inherited_



<p>A short, textual description of this widget.</p>



## Implementation

```dart
@override
String toStringShort() {
  final String type = objectRuntimeType(this, 'Widget');
  return key == null ? type : '$type-$key';
}
```







