


# SliderComponent constructor







SliderComponent({Key key, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [SliderMode](../../components_slider_component_slider_component/SliderMode-class.md) mode, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [int](https://api.flutter.dev/flutter/dart-core/int-class.html) width, @[required](https://pub.dev/documentation/meta/1.3.0/meta/required-constant.html) [int](https://api.flutter.dev/flutter/dart-core/int-class.html) height, [ValueChanged](../../components_slider_component_slider_component/ValueChanged.md)&lt;[double](https://api.flutter.dev/flutter/dart-core/double-class.html)> onValueChanged, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) minimumRange, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) maximumRange, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) currentValue, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) selectionColor, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) arcColorStart, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) arcColorEnd, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) strokeWidth = DEFAULT_STROKE_WIDTH, Widget centerWidget, Widget footerWidget})





## Implementation

```dart
SliderComponent(
    {Key key,
    @required this.mode,
    @required this.width,
    @required this.height,
    this.onValueChanged,
    this.minimumRange,
    this.maximumRange,
    this.currentValue,
    this.selectionColor,
    this.arcColorStart,
    this.arcColorEnd,
    this.strokeWidth = DEFAULT_STROKE_WIDTH,
    this.centerWidget,
    this.footerWidget})
    : assert(maximumRange > minimumRange),
      assert(currentValue >= minimumRange && currentValue <= maximumRange),
      super(key: key) {
  loadAssets();
}
```







