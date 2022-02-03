


# getLockStateIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getLockStateIcon
([LockProvider](../../providers_lock_provider/LockProvider-class.md) lockProvider)








## Implementation

```dart
Widget getLockStateIcon(LockProvider lockProvider) {
  return (lockProvider.isBusy)
      ? Center(child: CircularProgressIndicator())
      : DeviceItemIcon.buildLockUnlockIcon(
          lockProvider.getIsLockedState,
          WidgetStyleConstants.defaultDeviceWidgetSize,
          (lockProvider.getIsLockedState)
              ? WidgetStyleConstants.deviceDetailIconColorActive
              : WidgetStyleConstants.deviceDetailIconColorInactive,
        );
}
```







