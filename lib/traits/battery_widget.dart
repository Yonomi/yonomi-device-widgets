import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BatteryWidget extends StatelessWidget {
  final BatteryLevelTraitProvider _batteryLevelTraitProvider;
  late final Color _iconColor;
  late final Color _textColor;

  BatteryWidget(this._batteryLevelTraitProvider,
      {Color iconColor = WidgetStyleConstants.deviceIconColor,
      Color textColor = Colors.white}) {
    this._iconColor = iconColor;
    this._textColor = textColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_batteryLevelTraitProvider.isLoading) {
      return CircularProgressIndicator();
    } else if (_batteryLevelTraitProvider.isInErrorState) {
      return Icon(Icons.error);
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                'BATTERY',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: _textColor),
                textAlign: TextAlign.left,
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                '${_batteryLevelTraitProvider.getBatteryLevel}% Battery',
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: _getBatteryLevelColor(
                        _batteryLevelTraitProvider.getBatteryLevel)),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SizedBox(
                width: 100,
                height: 100,
                child: BatteryLevelIcon(
                  _batteryLevelTraitProvider.getBatteryLevel,
                  size: 100.0,
                  color: _iconColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Battery Level: ${_batteryLevelTraitProvider.getBatteryLevel}%",
              style: TextStyle(
                  fontSize: 22, fontStyle: FontStyle.normal, color: _textColor),
            ),
          ]);
    }
  }

  Color _getBatteryLevelColor(int batteryLevel) {
    if (batteryLevel >= WidgetStyleConstants.batteryFullMin) {
      return WidgetStyleConstants.globalSuccessColor;
    } else if (batteryLevel <= WidgetStyleConstants.batteryLowMax) {
      return WidgetStyleConstants.globalWarningColor;
    } else {
      return _textColor;
    }
  }
}
