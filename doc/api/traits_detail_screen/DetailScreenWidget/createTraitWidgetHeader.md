


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
<<<<<<< HEAD
                LockIcon(lockProvider.isLocked, size: 20.0),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(lockProvider.getLockTrait().name,
                        style: TextStyle(fontSize: 20, color: Colors.black))),
=======
                LockIcon(
                  lockProvider.isLocked,
                  size: 20.0,
                  color: WidgetStyleConstants.deviceDetailIconColorActive,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(lockProvider.getLockTrait().name,
                        style: TextStyle(
                            fontSize: 20,
                            color: WidgetStyleConstants.darkTextColor))),
>>>>>>> bb10565 (docs: updated dartdocs)
              ],
            ));
      });
    case 'power':
      return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
<<<<<<< HEAD
                PowerItemIcon(powerProvider.getOnOffState, size: 20.0),
=======
                PowerItemIcon(powerProvider.getOnOffState,
                    size: 20.0,
                    color: WidgetStyleConstants.deviceDetailIconColorActive),
>>>>>>> bb10565 (docs: updated dartdocs)
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        (powerProvider.getPowerTrait()?.name ??
                            'Power Switch'),
<<<<<<< HEAD
                        style: TextStyle(fontSize: 20))),
=======
                        style: TextStyle(
                            fontSize: 20,
                            color: WidgetStyleConstants.darkTextColor))),
>>>>>>> bb10565 (docs: updated dartdocs)
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
<<<<<<< HEAD
=======
                color: WidgetStyleConstants.deviceDetailIconColorActive,
>>>>>>> bb10565 (docs: updated dartdocs)
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
<<<<<<< HEAD
=======
              color: WidgetStyleConstants.deviceDetailIconColorActive,
>>>>>>> bb10565 (docs: updated dartdocs)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,
<<<<<<< HEAD
                  style: TextStyle(fontSize: 20, color: Colors.black)),
=======
                  style: TextStyle(
                      fontSize: 20,
                      color: WidgetStyleConstants.darkTextColor)),
>>>>>>> bb10565 (docs: updated dartdocs)
            ),
          ],
        ),
      );
  }
}
```







