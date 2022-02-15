


# getIsJammedState property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) getIsJammedState
  







## Implementation

```dart
bool get getIsJammedState =>
    getLockTrait()?.stateWhereType<IsJammed>().value ?? false;
```








