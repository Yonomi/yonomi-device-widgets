


# BatteryWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BatteryWidget([BatteryLevelProvider](../../providers_battery_level_provider/BatteryLevelProvider-class.md) _batteryLevelProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.darkTextColor, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) iconSize = 100.0, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
BatteryWidget(this._batteryLevelProvider,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.darkTextColor,
    double iconSize = 100.0,
    Key? key})
    : super(key: key) {
  this._iconColor = iconColor;
  this._textColor = textColor;
  this._iconSize = iconSize;
}
```







