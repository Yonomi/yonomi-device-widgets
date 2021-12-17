


# buildLockUnlockIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




dynamic buildLockUnlockIcon
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isLocked, [[double](https://api.flutter.dev/flutter/dart-core/double-class.html) size = WidgetStyleConstants.defaultDeviceIconSize, [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) color = WidgetStyleConstants.deviceIconColor])








## Implementation

```dart
static buildLockUnlockIcon(bool isLocked,
    [double size = WidgetStyleConstants.defaultDeviceIconSize,
    Color color = WidgetStyleConstants.deviceIconColor]) {
  return LockIcon(
    isLocked,
    size: size,
    color: color,
  );
}
```







