import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';

class PowerWidget extends StatelessWidget {
  PowerTraitProvider powerTraitProvider;

  PowerWidget(@required this.powerTraitProvider);

  @override
  Widget build(BuildContext context) {
    if (powerTraitProvider.isBusy) {
      print("In Busy State");
      return CircularProgressIndicator();
    } else if (powerTraitProvider.isInErrorState) {
      print("In Error State");
      _showToast(context, powerTraitProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      print("Show Switch with its state");
      return CupertinoSwitch(
        value: powerTraitProvider.getOnOffState,
        onChanged: (bool onOff) {
          print('turned ${(onOff) ? 'on' : 'off'}');
          powerTraitProvider.sendPowerOnOffAction(onOff);
        },
      );
    }
  }

  void _showToast(BuildContext context, String message) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            ));
  }
}
