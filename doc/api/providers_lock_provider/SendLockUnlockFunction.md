


# SendLockUnlockFunction typedef






    *[<Null safety>](https://dart.dev/null-safety)*




    [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> SendLockUnlockFunction = [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> Function([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) lockUnlock)






## Implementation

```dart
typedef SendLockUnlockFunction = Future<void> Function(
    Request request, String id, bool lockUnlock);
```






