


# setErrorState method




    *[<Null safety>](https://dart.dev/null-safety)*




void setErrorState
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMsg)








## Implementation

```dart
void setErrorState(String errorMsg) {
  _setErrorMessage = errorMsg;
  setState = WidgetState.error;
}
```







