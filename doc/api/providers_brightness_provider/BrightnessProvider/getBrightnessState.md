


# getBrightnessState property




    *[<Null safety>](https://dart.dev/null-safety)*




[int](https://api.flutter.dev/flutter/dart-core/int-class.html)? getBrightnessState
  







## Implementation

```dart
int? get getBrightnessState =>
    getBrightnessTrait()?.stateWhereType<Brightness>().value as int?;
```








