


# createTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidget
<<<<<<< HEAD
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive})
=======
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait)
>>>>>>> main








## Implementation

```dart
<<<<<<< HEAD
Widget createTraitWidget(String name,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
  switch (name) {
    case 'lock':
=======
Widget createTraitWidget(Trait trait) {
  switch (trait.runtimeType) {
    case LockTrait:
>>>>>>> main
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(lockProvider,
              iconColor: iconColor, textColor: textColor),
        );
      });
    case PowerTrait:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PowerWidget(powerProvider,
              iconColor: iconColor, textColor: textColor),
        );
      });
    case BatteryLevelTrait:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
<<<<<<< HEAD
          child: BatteryWidget(batteryLevelTraitProvider,
              iconColor: iconColor, textColor: textColor),
=======
          child: BatteryWidget(batteryLevelProvider),
>>>>>>> main
        );
      });
    default:
      return Padding(
<<<<<<< HEAD
          padding: const EdgeInsets.all(8.0),
          child: UnknownItemIcon(color: iconColor));
=======
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            UnknownItemIcon(
              size: 20.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(trait.name, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      );
>>>>>>> main
  }
}
```







