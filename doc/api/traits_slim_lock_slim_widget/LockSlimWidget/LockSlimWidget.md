


# LockSlimWidget constructor




    *[<Null safety>](https://dart.dev/null-safety)*



LockSlimWidget([LockProvider](../../providers_lock_provider/LockProvider-class.md) lockProvider, {[Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html)? backgroundColor, [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})





## Implementation

```dart
LockSlimWidget(LockProvider lockProvider, {Color? backgroundColor, Key? key})
    : super(
          provider: lockProvider,
          leftIcon: LockIcon(lockProvider.getIsLockedState,
              size: 20.0,
              color: WidgetStyleConstants.deviceDetailIconColorActive),
          rightIcon: CupertinoSwitch(
            onChanged: (bool value) {
              _lockTap(lockProvider);
            },
            value: lockProvider.getIsLockedState,
          ),
          headerText: Text(lockProvider.deviceDetail?.displayName ?? 'LOCK',
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
          backgroundColor: backgroundColor,
          key: key);
```







