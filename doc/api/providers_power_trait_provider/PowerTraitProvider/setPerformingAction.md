


# setPerformingAction property




    *[<Null safety>](https://dart.dev/null-safety)*





setPerformingAction=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setIsPerformingAction)  







## Implementation

```dart
set setPerformingAction(bool setIsPerformingAction) {
  _isPerformingAction = setIsPerformingAction;
  _isLoading = false;
  _isInErrorState = false;
  notifyListeners();
}
```







