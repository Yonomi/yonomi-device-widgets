


# getUnknownStateIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getUnknownStateIcon
([UnknownProvider](../../providers_unknown_provider/UnknownProvider-class.md) provider)








## Implementation

```dart
Widget getUnknownStateIcon(UnknownProvider provider) {
  return (provider.loadingDetail || provider.loadingAction)
      ? Center(child: CircularProgressIndicator())
      : UnknownItemIcon(
          size: WidgetStyleConstants.defaultDeviceWidgetSize,
          color: WidgetStyleConstants.deviceDetailIconColorActive);
}
```







