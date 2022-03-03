


# getIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getIcon
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
static Widget getIcon(List<sdk.Trait> traits) {
  try {
    sdk.Trait determiningTrait = traits[0];
    switch (determiningTrait.runtimeType) {
      case sdk.LockTrait:
        return LockIcon(
            findIconStateValue<sdk.IsLocked, bool>(determiningTrait.states));
      case sdk.ThermostatTrait:
        return ThermostatIcon(
            thermostatState:
                findIconStateValue<sdk.TargetTemperature, double?>(
                    determiningTrait.states));
      case sdk.PowerTrait:
        return PowerItemIcon(
            findIconStateValue<sdk.IsOnOff, bool>(determiningTrait.states));
      case sdk.BatteryLevelTrait:
        return BatteryLevelIcon(findIconStateValue<sdk.BatteryLevel, int>(
            determiningTrait.states));
      default:
        return UnknownItemIcon();
    }
  } catch (e) {
    return UnknownItemIcon();
  }
}
```







