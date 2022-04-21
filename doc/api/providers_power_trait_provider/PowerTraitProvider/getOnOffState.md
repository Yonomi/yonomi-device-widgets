


# getOnOffState property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) getOnOffState
  







## Implementation

```dart
bool get getOnOffState =>
    getPowerTrait()?.stateWhereType<IsOnOff>()?.value ?? false;
```








