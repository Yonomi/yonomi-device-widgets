


# shouldDisplayJammedState method




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) shouldDisplayJammedState
()








## Implementation

```dart
bool shouldDisplayJammedState() {
  final bool supportsIsJammed =
      _lockProvider.getLockTrait()?.supportsIsJammed ?? false;
  return supportsIsJammed && _lockProvider.getIsJammedState;
}
```







