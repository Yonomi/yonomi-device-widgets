


# LockIcon constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockIcon([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isLocked, {dynamic size = WidgetStyleConstants.defaultDeviceIconSize, dynamic color = WidgetStyleConstants.deviceIconColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
LockIcon(bool isLocked,
    {size = WidgetStyleConstants.defaultDeviceIconSize,
    color = WidgetStyleConstants.deviceIconColor,
    Key? key})
    : super(key: key) {
  this._size = size;
  this._color = color;
  this._locked = isLocked;
}
```







