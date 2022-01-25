


# produceSlimWidget&lt;T extends Trait> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceSlimWidget
&lt;T extends Trait>({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, dynamic backgroundColor = Colors.white})








## Implementation

```dart
static Widget produceSlimWidget<T extends Trait>(
    {String? name, backgroundColor = Colors.white}) {
  switch (T) {
    case LockTrait:
      return Consumer<LockProvider>(builder: (_, lockProvider, __) {
        return LockSlimWidget(lockProvider, backgroundColor: backgroundColor);
      });
    case PowerTrait:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, __) {
        return PowerSlimWidget(powerProvider,
            backgroundColor: backgroundColor);
      });
    case BatteryLevelTrait:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, __) {
        return BatterySlimWidget(batteryLevelProvider,
            backgroundColor: backgroundColor,
            content: BatteryWidget(
              batteryLevelProvider,
              iconSize: 100.0,
              textColor: WidgetStyleConstants.darkTextColor,
              iconColor: WidgetStyleConstants.deviceDetailIconColorActive,
            ));
      });
    case ThermostatTrait:
      return Consumer<ThermostatProvider>(
          builder: (_, thermostatProvider, __) {
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







