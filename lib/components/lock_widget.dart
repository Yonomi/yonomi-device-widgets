import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/device_item_icon.dart';
import 'package:yonomi_device_widgets/components/arc.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lockProvider = Provider.of<LockProvider>(context, listen: true);

    return lockProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: <Widget>[
                Text(
                  lockProvider.deviceDetail?.displayName ?? 'LOCK',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Arc(
                showThumb: false,
                centerWidget: SizedBox(
                    width: WidgetStyleConstants.defaultDeviceWidgetSize,
                    height: WidgetStyleConstants.defaultDeviceWidgetSize,
                    child: GestureDetector(
                      child: getLockStateIcon(lockProvider),
                      onTap: () {
                        bool setLock = !lockProvider.isLocked;
                        lockProvider.setLockUnlockAction(
                            lockProvider.deviceDetail?.id ?? '', setLock);
                      },
                    )),
                color: lockProvider.isLocked
                    ? WidgetStyleConstants.deviceDetailIconColorActive
                    : WidgetStyleConstants.deviceDetailIconColorInactive,
                initialValue: 0.0,
                maxValue: 1.0,
                onFinalSetPoint: (double value) {},
              ),
            ),
          ]);
  }

  Widget getLockStateIcon(LockProvider lockProvider) {
    return (lockProvider.isBusy)
        ? Center(child: CircularProgressIndicator())
        : DeviceItemIcon.buildLockUnlockIcon(
            lockProvider.isLocked,
            WidgetStyleConstants.defaultDeviceWidgetSize,
            (lockProvider.isLocked)
                ? WidgetStyleConstants.deviceDetailIconColorActive
                : WidgetStyleConstants.deviceDetailIconColorInactive,
          );
  }
}
