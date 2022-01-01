


# isInErrorState property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isInErrorState
  




<p>To know if this ChangeNotifier had an error
see <a href="../../providers_device_provider/DeviceProvider/getErrorMessage.md">getErrorMessage</a> to get the accomponying error message</p>



## Implementation

```dart
bool get isInErrorState => _state == WidgetState.error;
```








