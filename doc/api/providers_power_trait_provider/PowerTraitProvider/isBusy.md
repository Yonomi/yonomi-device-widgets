


# isBusy property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isBusy
  







## Implementation

```dart
bool get isBusy => (_currentState == PowerState.loading ||
    _currentState == PowerState.performingAction);
```








