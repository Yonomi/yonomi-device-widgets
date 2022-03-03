


# TemperatureRangeSlider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



TemperatureRangeSlider([double](https://api.flutter.dev/flutter/dart-core/double-class.html) sliderValue, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) min, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) max, void onChangeEnd([double](https://api.flutter.dev/flutter/dart-core/double-class.html))?, {[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
TemperatureRangeSlider(double sliderValue, double min, double max,
    void Function(double)? onChangeEnd,
    {Key? key})
    : super(key: key) {
  this.sliderValue = sliderValue;
  this.min = min;
  this.max = max;
  this.onChangeEnd = onChangeEnd;
}
```







