


# BatterySlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BatterySlimWidget([BatteryLevelProvider](../../providers_battery_level_provider/BatteryLevelProvider-class.md) _batteryLevelTraitProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)? content, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
BatterySlimWidget(BatteryLevelProvider _batteryLevelTraitProvider,
    {Color? backgroundColor, Widget? content, Key? key})
    : super(
        provider: _batteryLevelTraitProvider,
        content: content,
        backgroundColor: backgroundColor,
        leftIcon:
            _getBatteryLevelIcon(_batteryLevelTraitProvider.getBatteryLevel),
        headerText: Text(
            'Battery Level: ${_batteryLevelTraitProvider.getBatteryLevel}%',
            style: TextStyle(
                fontSize: 20,
                color: _getBatteryLevelTextColor(
                    _batteryLevelTraitProvider.getBatteryLevel))),
        key: key,
      );
```







