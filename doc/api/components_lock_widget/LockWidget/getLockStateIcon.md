


# getLockStateIcon method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getLockStateIcon
([LockProvider](../../providers_lock_provider/LockProvider-class.md) lockProvider)








## Implementation

```dart
Widget getLockStateIcon(LockProvider lockProvider) {
  return (lockProvider.loadingDetail || lockProvider.loadingAction)
      ? Center(child: CircularProgressIndicator())
      : (lockProvider.isLocked)
          ? DeviceItemIcon.buildLockIcon(
              175, WidgetStyleConstants.deviceDetailIconColorActive)
          : DeviceItemIcon.buildUnlockIcon(
              175, WidgetStyleConstants.deviceDetailIconColorInactive);
}
```







