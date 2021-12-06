


# buildUnlockIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildUnlockIcon
([[double](https://api.flutter.dev/flutter/dart-core/double-class.html) size = WidgetStyleConstants.defaultDeviceIconSize, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) color = WidgetStyleConstants.deviceIconColor])








## Implementation

```dart
static Widget buildUnlockIcon(
    [double size = WidgetStyleConstants.defaultDeviceIconSize,
    Color color = WidgetStyleConstants.deviceIconColor]) {
  print('REACHED BUILD UNLOCK ICON');

  return LockIcon(
    false,
    size: size,
    color: color,
  );
}
```







