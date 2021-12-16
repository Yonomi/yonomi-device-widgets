


# isInErrorState property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isInErrorState
  




<p>To know if this ChangeNotifier had an error
see <a href="../../providers_power_trait_provider/PowerTraitProvider/getErrorMessage.md">getErrorMessage</a> to get the accomponying error message</p>



## Implementation

```dart
bool get isInErrorState => _currentState == PowerState.error;
```








