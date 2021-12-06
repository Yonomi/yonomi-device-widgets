import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/device_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lockProvider = Provider.of<LockProvider>(context, listen: true);

    return lockProvider.loadingDetail
        ? Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Text(
                    lockProvider.deviceDetail.displayName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: lockProvider.loadingDetail
                        ? CircularProgressIndicator()
                        : lockProvider.isLocked
                            ? Icon(
                                BootstrapIcons.lock,
                                size: 100,
                              )
                            : Icon(
                                BootstrapIcons.unlock,
                                size: 100,
                              )),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoSwitch(
                onChanged: (bool value) {
                  _lockTap(lockProvider);
                },
                value: lockProvider.isLocked,
              ),
            ],
          );
  }

  Widget getLockStateIcon(LockProvider lockProvider) {
    return (lockProvider.loadingDetail || lockProvider.loadingAction)
        ? Center(child: CircularProgressIndicator())
        : (lockProvider.isLocked)
            ? DeviceItemIcon.buildLockIcon(
                175, WidgetStyleConstants.deviceDetailIconColorActive)
            : DeviceItemIcon.buildUnlockIcon(
                175, WidgetStyleConstants.deviceDetailIconColorInactive);
  }

  void _lockTap(LockProvider provider) {
    bool setLock = !provider.isLocked;
    provider.setLockUnlockAction(provider.deviceDetail.id, setLock);
  }
}
