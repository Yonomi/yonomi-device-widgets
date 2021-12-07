


# setErrorState property




    *[<Null safety>](https://dart.dev/null-safety)*





setErrorState=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) newIsError)  







## Implementation

```dart
set setErrorState(bool newIsError) {
  _isInErrorState = newIsError;
  _isLoading = false;
  _isPerformingAction = false;
  notifyListeners();
}
```







