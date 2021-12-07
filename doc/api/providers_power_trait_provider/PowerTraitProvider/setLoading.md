


# setLoading property




    *[<Null safety>](https://dart.dev/null-safety)*





setLoading=
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setIsLoading)  







## Implementation

```dart
set setLoading(bool setIsLoading) {
  _isLoading = setIsLoading;
  _isPerformingAction = false;
  _isInErrorState = false;
  notifyListeners();
}
```







