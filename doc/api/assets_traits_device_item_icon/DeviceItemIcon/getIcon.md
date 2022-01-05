


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
      return LockIcon(determiningTrait.state.value);
    case ThermostatTrait:
      return ThermostatIcon(thermostatState: determiningTrait.state.value);
    case PowerTrait:
      return PowerItemIcon(determiningTrait.state.value);
    case BatteryLevelTrait:
      return BatteryLevelIcon(determiningTrait.state.value);
    default:
      return UnknownItemIcon();
  }
}
```







