


# getIcon method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getIcon
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/repository_devices_devices_repository/Trait-class.html)> traits)








## Implementation

```dart
static Widget getIcon(List<Trait> traits) {
  Trait determiningTrait = traits[0];
  if (determiningTrait is LockUnlockTrait) {
    return (determiningTrait.state.value)
        ? buildLockIcon()
        : buildUnlockIcon();
  }
  if (determiningTrait is ThermostatTrait) {
    return buildThermostatIcon(determiningTrait.state.value);
  }
  return Icon(
    Icons.device_unknown,
    size: 60,
    color: WidgetStyleConstants.deviceIconColor,
  );
}
```







