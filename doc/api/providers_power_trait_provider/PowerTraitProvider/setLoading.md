


# setLoading property




    *[<Null safety>](https://dart.dev/null-safety)*





setLoading=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) newIsLoading)  







## Implementation

```dart
set setLoading(bool newIsLoading) {
  _isPerformingAction = false;
  _isLoading = newIsLoading;
  _isInErrorState = false;
  notifyListeners();
}
```







