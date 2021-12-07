import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';

class LockWidget extends StatelessWidget {
  late final LockProvider _lockProvider;

  LockWidget(this._lockProvider);

  @override
  Widget build(BuildContext context) {
    return _lockProvider.loadingDetail
        ? Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Text(
                    _lockProvider.getLockTrait().name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: _lockProvider.loadingAction
                          ? CircularProgressIndicator()
                          : _lockProvider.isLocked
                              ? Icon(
                                  BootstrapIcons.lock,
                                  size: 100,
                                )
                              : Icon(
                                  BootstrapIcons.unlock,
                                  size: 100,
                                )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoSwitch(
                onChanged: (bool value) {
                  _lockTap(_lockProvider);
                },
                value: _lockProvider.isLocked,
              ),
            ],
          );
  }

  void _lockTap(LockProvider provider) {
    bool setLock = !provider.isLocked;
    provider.setLockUnlockAction(provider.deviceDetail.id, setLock);
  }
}
