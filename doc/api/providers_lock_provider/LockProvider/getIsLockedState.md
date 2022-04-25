


# getIsLockedState property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) getIsLockedState
  







## Implementation

```dart
bool get getIsLockedState =>
    getLockTrait()?.stateWhereType<IsLocked>()?.value ?? false;
```








