


# produceWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceWidget
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive})








## Implementation

```dart
static Widget produceWidget(Trait trait,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
  switch (trait.runtimeType) {
    case LockTrait:
      return Consumer<LockProvider>(builder: (_, lockProvider, __) {
        return LockWidget(lockProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case PowerTrait:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, __) {
        return PowerWidget(powerProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case BatteryLevelTrait:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, __) {
        return BatteryWidget(batteryLevelProvider,
            iconColor: iconColor, textColor: textColor);
      });
    case ThermostatTrait:
      return Consumer<ThermostatProvider>(
        builder: (_, thermostatProvider, __) {
          return ThermostatWidget(thermostatProvider, textColor: textColor);
        },
      );
    case BrightnessTrait:
      return Consumer<BrightnessProvider>(
        builder: (_, brightnessProvider, __) {
          return BrightnessWidget(brightnessProvider, textColor: textColor);
        },
      );
    default:
      return UnknownWidget(name: trait.name, iconColor: iconColor);
  }
}
```







