import 'package:device_widgets/components/arc.dart';
import 'package:device_widgets/providers/lock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lockProvider = Provider.of<LockProvider>(context, listen: true);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          centerWidget: Text(
            lockProvider.isLocked ? "Locked" : "Unlocked",
            style: Theme.of(context).textTheme.headline2,
          ),
          initialValue: 0.0,
          onFinalSetPoint: (double value) {
            bool setLock = value != 0;
            lockProvider.setLockUnlockAction(
                lockProvider?.deviceDetail?.id, setLock);
          },
          maxValue: 1,
        ),
      ),
    ]);
  }
}
