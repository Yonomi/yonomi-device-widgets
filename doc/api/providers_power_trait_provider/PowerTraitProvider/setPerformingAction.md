


# setPerformingAction property




    *[<Null safety>](https://dart.dev/null-safety)*





setPerformingAction=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) newIsPerformingAction)  







## Implementation

```dart
set setPerformingAction(bool newIsPerformingAction) {
  _isPerformingAction = newIsPerformingAction;
  _isLoading = false;
  _isInErrorState = false;
  notifyListeners();
}
```







