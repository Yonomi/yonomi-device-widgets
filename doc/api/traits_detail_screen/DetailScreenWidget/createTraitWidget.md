


# createTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidget
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive})








## Implementation

```dart
Widget createTraitWidget(String name,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
  switch (name) {
    case 'lock':
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(lockProvider,
              iconColor: iconColor, textColor: textColor),
        );
      });
    case 'power':
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PowerWidget(powerProvider,
              iconColor: iconColor, textColor: textColor),
        );
      });
    case 'battery_level':
      return Consumer<BatteryLevelTraitProvider>(
          builder: (_, batteryLevelTraitProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BatteryWidget(batteryLevelTraitProvider,
              iconColor: iconColor, textColor: textColor),
        );
      });
    case 'battery_level':
      return Consumer<BatteryLevelTraitProvider>(
          builder: (_, batteryLevelTraitProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BatteryWidget(batteryLevelTraitProvider),
        );
      });
    default:
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: UnknownItemIcon(color: iconColor));
  }
}
```







