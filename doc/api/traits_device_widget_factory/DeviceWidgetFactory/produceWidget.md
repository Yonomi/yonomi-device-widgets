


# produceWidget&lt;T extends Trait> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) produceWidget
&lt;T extends Trait>({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive})








## Implementation

```dart
static Widget produceWidget<T extends Trait>(
    {String? name,
    Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
  switch (T) {
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
    default:
      return UnknownWidget(name: name, iconColor: iconColor);
  }
}
```







