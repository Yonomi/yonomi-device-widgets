


# LockWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockWidget([LockProvider](../../providers_lock_provider/LockProvider-class.md) _lockProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.darkTextColor, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) iconSize = 100, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
LockWidget(this._lockProvider,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.darkTextColor,
    double iconSize = 100,
    Key? key})
    : super(key: key) {
  this._iconColor = iconColor;
  this._textColor = textColor;
  this._iconSize = iconSize;
}
```







