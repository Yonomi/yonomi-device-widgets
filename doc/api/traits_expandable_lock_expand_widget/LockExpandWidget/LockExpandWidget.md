


# LockExpandWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockExpandWidget([LockProvider](../../providers_lock_provider/LockProvider-class.md) _lockProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
LockExpandWidget(LockProvider _lockProvider,
    {Color? backgroundColor, Key? key})
    : super(
          leftIcon: LockIcon(_lockProvider.isLocked,
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          rightIcon: CupertinoSwitch(
            onChanged: (bool value) {
              _lockTap(_lockProvider);
            },
            value: _lockProvider.isLocked,
          ),
          headerText: Text(_lockProvider.deviceDetail.displayName,
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          key: key);
```







