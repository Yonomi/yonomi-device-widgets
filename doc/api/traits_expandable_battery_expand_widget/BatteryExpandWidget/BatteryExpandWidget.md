


# BatteryExpandWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



BatteryExpandWidget(dynamic _batteryLevelTraitProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
BatteryExpandWidget(_batteryLevelTraitProvider,
    {Color? backgroundColor, Key? key})
    : super(
        backgroundColor: backgroundColor,
        leftIcon:
            _getBatteryLevelIcon(_batteryLevelTraitProvider.getBatteryLevel),
        headerText: Text(
            'Battery Level: ${_batteryLevelTraitProvider.getBatteryLevel}%',
            style: TextStyle(
                fontSize: 20,
                color: _getBatteryLevelTextColor(
                    _batteryLevelTraitProvider.getBatteryLevel))),
      );
```







