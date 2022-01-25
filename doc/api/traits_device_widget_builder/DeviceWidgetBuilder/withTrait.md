


# withTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[DeviceWidgetBuilder](../../traits_device_widget_builder/DeviceWidgetBuilder-class.md) withTrait
(dynamic trait, {[EdgeInsets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) padding = const EdgeInsets.all(8.0), [EdgeInsets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) margins = const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)})








## Implementation

```dart
DeviceWidgetBuilder withTrait(trait,
    {EdgeInsets padding = const EdgeInsets.all(8.0),
    EdgeInsets margins =
        const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
  _traitWidgets.add(_card(_createTraitListWidget(trait), padding, margins));

  return this;
}
```







