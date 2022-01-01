import 'package:flutter/cupertino.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/device_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockSlimWidget extends DeviceSlimWidget {
  LockSlimWidget(LockProvider lockProvider, {Color? backgroundColor, Key? key})
      : super(
            provider: lockProvider,
            leftIcon: LockIcon(lockProvider.isLocked,
                size: 20.0,
                color: WidgetStyleConstants.deviceDetailIconColorActive),
            rightIcon: CupertinoSwitch(
              onChanged: (bool value) {
                _lockTap(lockProvider);
              },
              value: lockProvider.isLocked,
            ),
            headerText: Text(lockProvider.deviceDetail?.displayName ?? 'LOCK',
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            backgroundColor: backgroundColor,
            key: key);

  static void _lockTap(LockProvider provider) {
    bool setLock = !provider.isLocked;
    provider.setLockUnlockAction(provider.deviceDetail?.id ?? '', setLock);
  }
}
