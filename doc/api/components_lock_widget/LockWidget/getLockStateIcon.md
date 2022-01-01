


# getLockStateIcon method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) getLockStateIcon
([LockProvider](../../providers_lock_provider/LockProvider-class.md) lockProvider)








## Implementation

```dart
Widget getLockStateIcon(LockProvider lockProvider) {
  return (lockProvider.isLoading || lockProvider.isPerformingAction)
      ? Center(child: CircularProgressIndicator())
      : DeviceItemIcon.buildLockUnlockIcon(
          lockProvider.isLocked,
          WidgetStyleConstants.defaultDeviceWidgetSize,
          (lockProvider.isLocked)
              ? WidgetStyleConstants.deviceDetailIconColorActive
              : WidgetStyleConstants.deviceDetailIconColorInactive,
        );
}
```







