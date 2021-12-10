


# getLockStateIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getLockStateIcon
([LockProvider](../../providers_lock_provider/LockProvider-class.md) lockProvider)








## Implementation

```dart
Widget getLockStateIcon(LockProvider lockProvider) {
  return (lockProvider.loadingDetail || lockProvider.loadingAction)
      ? Center(child: CircularProgressIndicator())
      : (lockProvider.isLocked)
          ? DeviceItemIcon.buildLockIcon(
              WidgetStyleConstants.defaultDeviceWidgetSize,
              WidgetStyleConstants.deviceDetailIconColorActive)
          : DeviceItemIcon.buildUnlockIcon(
              WidgetStyleConstants.defaultDeviceWidgetSize,
              WidgetStyleConstants.deviceDetailIconColorInactive);
}
```







