


# getIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getIcon
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
static Widget getIcon(List<Trait> traits) {
  Trait determiningTrait = traits[0];
  if (determiningTrait is LockTrait) {
    return (determiningTrait.state.value)
        ? buildLockIcon()
        : buildUnlockIcon();
  }
  if (determiningTrait is ThermostatTrait) {
    return buildThermostatIcon(determiningTrait.state.value);
  }
  return buildUnknownIcon();
}
```







