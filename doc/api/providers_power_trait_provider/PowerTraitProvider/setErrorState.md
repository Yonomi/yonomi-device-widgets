


# setErrorState property




    *[<Null safety>](https://dart.dev/null-safety)*





setErrorState=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setIsError)  







## Implementation

```dart
set setErrorState(bool setIsError) {
  _isInErrorState = setIsError;
  _isLoading = false;
  _isPerformingAction = false;
  notifyListeners();
}
```







