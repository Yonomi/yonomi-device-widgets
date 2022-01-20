


# produceSlimWidget&lt;T extends DeviceProvider> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceSlimWidget
&lt;T extends DeviceProvider>({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, dynamic backgroundColor = Colors.white})








## Implementation

```dart
static Widget produceSlimWidget<T extends DeviceProvider>(
    {String? name, backgroundColor = Colors.white}) {
  switch (T) {
    case LockProvider:
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return LockSlimWidget(lockProvider, backgroundColor: backgroundColor);
      });
    case PowerTraitProvider:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return PowerSlimWidget(powerProvider,
            backgroundColor: backgroundColor);
      });
    case BatteryLevelProvider:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, child) {
        return BatterySlimWidget(batteryLevelProvider,
            backgroundColor: backgroundColor,
            content: BatteryWidget(
              batteryLevelProvider,
              iconSize: 100.0,
              textColor: WidgetStyleConstants.darkTextColor,
              iconColor: WidgetStyleConstants.deviceDetailIconColorActive,
            ));
      });
    case ThermostatProvider:
      return Consumer<ThermostatProvider>(
          builder: (_, thermostatProvider, child) {
        return ThermostatSlimWidget(
          thermostatProvider,
          backgroundColor: backgroundColor,
        );
      });
    default:
      return UnknownSlimWidget(name ?? '', backgroundColor: backgroundColor);
  }
}
```







