import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PowerWidget extends StatelessWidget {
  final PowerTraitProvider _powerTraitProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  PowerWidget(this._powerTraitProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.darkTextColor,
      double iconSize = 100.0,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._iconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    if (_powerTraitProvider.isBusy) {
      return CircularProgressIndicator();
    } else if (_powerTraitProvider.isInErrorState) {
      _showToast(context, _powerTraitProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      final onOffState = _powerTraitProvider.getOnOffState;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(
                'POWER',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: _textColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: SizedBox(
                  width: _iconSize,
                  height: _iconSize,
                  child: PowerItemIcon(onOffState,
                      size: _iconSize, color: _iconColor)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoSwitch(
            activeColor: WidgetStyleConstants.traitDetailSwitchPressedColor,
            onChanged: (bool onOff) {
              if (_powerTraitProvider.supportsToggle)
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
