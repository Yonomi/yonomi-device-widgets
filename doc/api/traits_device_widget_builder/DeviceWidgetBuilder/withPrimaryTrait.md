


# withPrimaryTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[DeviceWidgetBuilder](../../traits_device_widget_builder/DeviceWidgetBuilder-class.md) withPrimaryTrait
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) iconColor = WidgetStyleConstants.deviceDetailIconColorActive, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) textColor = WidgetStyleConstants.deviceDetailIconColorActive, dynamic padding = const EdgeInsets.all(8.0), dynamic margins = const EdgeInsets.only(bottom: 8.0)})








## Implementation

```dart
DeviceWidgetBuilder withPrimaryTrait(Trait trait,
    {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive,
    padding = const EdgeInsets.all(8.0),
    margins = const EdgeInsets.only(bottom: 8.0)}) {
  _primaryTraitWidgets.add(_card(
      DeviceWidgetFactory.produceWidget(trait,
          iconColor: iconColor, textColor: textColor),
      padding,
      margins));

  return this;
}
```







