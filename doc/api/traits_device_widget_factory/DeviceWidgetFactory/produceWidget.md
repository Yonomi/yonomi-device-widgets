


# produceWidget&lt;T extends DeviceProvider> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceWidget
&lt;T extends DeviceProvider>({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive})








## Implementation

```dart
static Widget produceWidget<T extends DeviceProvider>(
    {String? name,
    Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
  switch (T) {
    case LockProvider:
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return LockWidget(lockProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case PowerTraitProvider:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return PowerWidget(powerProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case BatteryLevelProvider:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, child) {
        return BatteryWidget(batteryLevelProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case ThermostatProvider:
      return Consumer<ThermostatProvider>(
        builder: (_, thermostatProvider, child) {
          return ThermostatWidget(thermostatProvider, textColor: textColor);
        },
      );
    default:
      return UnknownWidget(name: name, iconColor: iconColor);
  }
}
```







