


# createTraitWidgetHeader method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createTraitWidgetHeader
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) name)








## Implementation

```dart
Widget createTraitWidgetHeader(String name) {
  switch (name) {
    case 'lock':
      return Consumer<LockProvider>(builder: (_, lockProvider, child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                LockIcon(lockProvider.isLocked, size: 20.0),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(lockProvider.getLockTrait().name,
                        style: TextStyle(fontSize: 20, color: Colors.black))),
              ],
            ));
      });
    case 'power':
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                PowerItemIcon(powerProvider.getOnOffState, size: 20.0),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        (powerProvider.getPowerTrait()?.name ??
                            'Power Switch'),
                        style: TextStyle(fontSize: 20))),
              ],
            ));
      });
    case 'battery_level':
      return Consumer<BatteryLevelTraitProvider>(
          builder: (_, batteryLevelTraitProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              BatteryLevelIcon(
                batteryLevelTraitProvider.getBatteryLevel,
                size: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Battery Level: ${batteryLevelTraitProvider.getBatteryLevel}%',
                    style: TextStyle(
                        fontSize: 20,
                        color: _getBatteryLevelColor(
                            batteryLevelTraitProvider.getBatteryLevel))),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ],
        ),
      );
  }
}
```






