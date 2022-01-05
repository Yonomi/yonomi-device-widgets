


# createTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidget
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait)








## Implementation

```dart
Widget createTraitWidget(Trait trait) {
  switch (trait.runtimeType) {
    case LockTrait:
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(lockProvider),
        );
      });
    case PowerTrait:
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PowerWidget(powerProvider),
        );
      });
    case BatteryLevelTrait:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BatteryWidget(batteryLevelProvider),
        );
      });
    default:
      return Padding(
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
  }
}
```







