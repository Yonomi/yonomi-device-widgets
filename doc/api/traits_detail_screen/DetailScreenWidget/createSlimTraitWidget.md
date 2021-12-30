


# createSlimTraitWidget method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) createSlimTraitWidget
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait)








## Implementation

```dart
Widget createSlimTraitWidget(Trait trait) {
  switch (trait.runtimeType) {
    case BatteryLevelTrait:
      return Consumer<BatteryLevelProvider>(
          builder: (_, batteryLevelProvider, child) {
        final batteryLevel = batteryLevelProvider.getBatteryLevel;

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
                  child: Text('Battery Level: $batteryLevel%',
                      style: TextStyle(
                          fontSize: 20,
                          color: _getBatteryLevelColor(batteryLevel))),
                ),
              ],
            ));
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
                child: Text(trait.name,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ));
  }
}
```







