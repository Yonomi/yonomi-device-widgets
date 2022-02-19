


# BrightnessWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BrightnessWidget([BrightnessProvider](../../providers_brightness_provider/BrightnessProvider-class.md) _brightnessProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.darkTextColor, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) iconSize = 100, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
BrightnessWidget(this._brightnessProvider,
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







