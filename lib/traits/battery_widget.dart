import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BatteryWidget extends StatelessWidget with ToastNotifications {
  final BatteryLevelProvider _batteryLevelProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  BatteryWidget(this._batteryLevelProvider,
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
    if (_batteryLevelProvider.isLoading) {
      return CircularProgressIndicator();
    } else if (_batteryLevelProvider.isInErrorState) {
      showToast(context, _batteryLevelProvider.getErrorMessage);
      return Icon(
        Icons.error,
        color: WidgetStyleConstants.globalWarningColor,
      );
    } else {
      final batteryLevel = _batteryLevelProvider.getBatteryLevel;
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
            Row(children: <Widget>[
              Text(
                '$batteryLevel% Battery',
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: _getBatteryLevelColor(batteryLevel)),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SizedBox(
                width: _iconSize,
                height: _iconSize,
                child: BatteryLevelIcon(
                  batteryLevel,
                  size: _iconSize,
                  color: _iconColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Battery Level: $batteryLevel%",
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
