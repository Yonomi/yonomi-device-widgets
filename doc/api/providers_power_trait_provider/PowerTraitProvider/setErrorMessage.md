


# setErrorMessage property




    *[<Null safety>](https://dart.dev/null-safety)*





setErrorMessage=
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMsg)  







## Implementation

```dart
set setErrorMessage(String errorMsg) {
  if (errorMsg.isEmpty) errorMsg = "An error occurred.";
  _latestErrorMsg = errorMsg;
}
```







