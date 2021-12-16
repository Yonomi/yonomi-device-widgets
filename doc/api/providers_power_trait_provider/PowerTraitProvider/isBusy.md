


# isBusy property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isBusy
  




<p>To know if this ChangeNotifier is busy from fetching data or running an action</p>



## Implementation

```dart
bool get isBusy => (_currentState == PowerState.loading ||
    _currentState == PowerState.performingAction);
```








