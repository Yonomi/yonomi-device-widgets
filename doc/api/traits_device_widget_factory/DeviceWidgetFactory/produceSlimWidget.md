


# produceSlimWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceSlimWidget
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait, {dynamic backgroundColor = Colors.white})








## Implementation

```dart
static Widget produceSlimWidget(Trait trait,
    {backgroundColor = Colors.white}) {
  switch (trait.runtimeType) {
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
            createContent: (context) => BatteryWidget(
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
    case BrightnessTrait:
      return Consumer<BrightnessProvider>(
          builder: (_, brightnessProvider, __) {
        return BrightnessSlimWidget(
          brightnessProvider,
          backgroundColor: backgroundColor,
        );
      });
    default:
      return UnknownSlimWidget(trait.name, backgroundColor: backgroundColor);
  }
}
```







