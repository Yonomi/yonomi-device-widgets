import 'package:flutter/cupertino.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockSlimWidget extends BaseSlimWidget {
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

  static void _lockTap(LockProvider provider) {
    bool setLock = !provider.getIsLockedState;
    provider.setLockUnlockAction(provider.deviceDetail?.id ?? '', setLock);
  }
}
