


# getBatteryLevelTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[BatteryLevelTrait](https://yonomi.co/yonomi-sdk/BatteryLevelTrait-class.html)? getBatteryLevelTrait
()








## Implementation

```dart
BatteryLevelTrait? getBatteryLevelTrait() {
  try {
    return _deviceDetail?.traits
            .firstWhere((trait) => trait.runtimeType == BatteryLevelTrait)
        as BatteryLevelTrait?;
  } catch (error) {
    _setErrorState(error.toString());
  }
}
```







