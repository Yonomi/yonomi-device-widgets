


# isPerformingAction property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isPerformingAction
  




<p>To know if this ChangeNotifier is performing an action</p>



## Implementation

```dart
bool get isPerformingAction => _currentState == WidgetState.performingAction;
```








