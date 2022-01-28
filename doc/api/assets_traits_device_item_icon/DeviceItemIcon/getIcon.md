


# getIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getIcon
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
static Widget getIcon(List<Trait> traits) {
  Trait determiningTrait = traits[0];
  switch (determiningTrait.runtimeType) {
    case LockTrait:
      return LockIcon(determiningTrait.states
          .firstWhere((state) => state is IsLocked)
          .value);
    case ThermostatTrait:
      return ThermostatIcon(
          thermostatState: determiningTrait.states
              .firstWhere((state) => state is TargetTemperature)
              .value);
    case PowerTrait:
      return PowerItemIcon(determiningTrait.states
          .firstWhere((state) => state is IsOnOff)
          .value);
    case BatteryLevelTrait:
      return BatteryLevelIcon(determiningTrait.states
          .firstWhere((state) => state is BatteryLevel)
          .value);
    default:
      return UnknownItemIcon();
  }
}
```







