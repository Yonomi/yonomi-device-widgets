


# getThermostatTraits method




    *[<Null safety>](https://dart.dev/null-safety)*




[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[ThermostatTrait](https://yonomi.co/yonomi-sdk/ThermostatTrait-class.html)> getThermostatTraits
()








## Implementation

```dart
List<ThermostatTrait> getThermostatTraits() {
  return deviceDetail?.traits
          .whereType<ThermostatTrait>()
          .toList(growable: false) ??
      <ThermostatTrait>[];
}
```







