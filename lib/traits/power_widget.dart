import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PowerWidget extends StatelessWidget {
  final PowerTraitProvider _powerTraitProvider;

  PowerWidget(this._powerTraitProvider);

  @override
  Widget build(BuildContext context) {
    if (_powerTraitProvider.isBusy) {
      return CircularProgressIndicator();
    } else if (_powerTraitProvider.isInErrorState) {
      _showToast(context, _powerTraitProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(
                'POWER',
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
                  child: PowerItemIcon(_powerTraitProvider.getOnOffState,
                      size: 100.0, color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoSwitch(
            activeColor: WidgetStyleConstants.traitDetailSwitchPressedColor,
            onChanged: (bool onOff) {
              _powerTraitProvider.sendPowerOnOffAction(onOff);
            },
            value: _powerTraitProvider.getOnOffState,
          ),
        ],
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
