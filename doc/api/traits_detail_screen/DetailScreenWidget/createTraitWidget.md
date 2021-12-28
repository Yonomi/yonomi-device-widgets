


# createTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidget
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name)








## Implementation

```dart
Widget createTraitWidget(String name) {
  switch (name) {
    case 'lock':
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LockWidget(lockProvider),
        );
      });
    case 'power':
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PowerWidget(powerProvider),
        );
      });
    case 'battery_level':
      return Consumer<BatteryLevelTraitProvider>(
          builder: (_, batteryLevelProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              BatteryLevelIcon(
                batteryLevelProvider.getBatteryLevel,
                size: 20.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Battery Level: ${batteryLevelProvider.getBatteryLevel}%',
                    style: TextStyle(fontSize: 20, color: _getBatteryLevelColor(batteryLevelProvider.getBatteryLevel))),
              ),
            ],
          ),
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
              child: Text(name, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      );
  }
}
```







