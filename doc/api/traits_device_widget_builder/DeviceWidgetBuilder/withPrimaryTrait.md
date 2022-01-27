


# withPrimaryTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[DeviceWidgetBuilder](../../traits_device_widget_builder/DeviceWidgetBuilder-class.md) withPrimaryTrait
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait, {dynamic padding = const EdgeInsets.all(8.0), dynamic margins = const EdgeInsets.only(bottom: 8.0)})








## Implementation

```dart
DeviceWidgetBuilder withPrimaryTrait(Trait trait,
    {padding = const EdgeInsets.all(8.0),
    margins = const EdgeInsets.only(bottom: 8.0)}) {
  _primaryTraitWidgets
      .add(_card(_createTraitWidget(trait), padding, margins));

  return this;
}
```







