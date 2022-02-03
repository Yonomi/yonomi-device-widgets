


# BatterySlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BatterySlimWidget(dynamic _batteryLevelTraitProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [CreateWidget](../../traits_slim_battery_slim_widget/CreateWidget.md)? createContent, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
BatterySlimWidget(_batteryLevelTraitProvider,
    {Color? backgroundColor, CreateWidget? createContent, Key? key})
    : super(
        provider: _batteryLevelTraitProvider,
        createContent: createContent,
        backgroundColor: backgroundColor,
        leftIcon:
            _getBatteryLevelIcon(
            _batteryLevelTraitProvider.getBatteryLevelState),
        headerText: Text(
            'Battery Level: ${_batteryLevelTraitProvider.getBatteryLevelState}%',
            style: TextStyle(
                fontSize: 20,
                color: _getBatteryLevelTextColor(
                    _batteryLevelTraitProvider.getBatteryLevelState))),
        key: key,
      );
```







