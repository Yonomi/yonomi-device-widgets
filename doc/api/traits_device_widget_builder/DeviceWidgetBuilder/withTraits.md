


# withTraits method




    *[<Null safety>](https://dart.dev/null-safety)*




[DeviceWidgetBuilder](../../traits_device_widget_builder/DeviceWidgetBuilder-class.md) withTraits
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits, {dynamic backgroundColor = Colors.white, [EdgeInsets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) padding = const EdgeInsets.all(8.0), [EdgeInsets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) margins = const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)})








## Implementation

```dart
DeviceWidgetBuilder withTraits(List<Trait> traits,
    {backgroundColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    EdgeInsets margins =
        const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
  traits.forEach((trait) {
    _withTrait(trait,
        backgroundColor: backgroundColor, padding: padding, margins: margins);
  });

  return this;
}
```







