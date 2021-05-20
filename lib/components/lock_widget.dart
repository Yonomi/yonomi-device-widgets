import 'package:device_widgets/assets/traits/device_item_icon.dart';
import 'package:device_widgets/components/arc.dart';
import 'package:device_widgets/providers/lock_provider.dart';
import 'package:device_widgets/ui/widget_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lockProvider = Provider.of<LockProvider>(context, listen: true);

    return lockProvider.loading
        ? Center(child: CircularProgressIndicator())
        : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: <Widget>[
                Text(
                  lockProvider?.deviceDetail?.displayName ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Arc(
                centerWidget: InkWell(
                  child: (lockProvider.isLocked)
                      ? DeviceItemIcon.getLockIcon(
                          175, WidgetStyleConstants.deviceDetailIconColorActive)
                      : DeviceItemIcon.getUnlockIcon(175,
                          WidgetStyleConstants.deviceDetailIconColorInactive),
                  onTap: () {
                    bool setLock = !lockProvider.isLocked;
                    lockProvider.setLockUnlockAction(
                        lockProvider?.deviceDetail?.id, setLock);
                  },
                ),
                initialValue: 0.0,
                maxValue: 1.0,
                onFinalSetPoint: (double value) {},
              ),
            ),
          ]);
  }
}
