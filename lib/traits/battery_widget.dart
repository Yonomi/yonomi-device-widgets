import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BatteryWidget extends StatelessWidget {
  final BatteryLevelTraitProvider _batteryLevelTraitProvider;

  BatteryWidget(this._batteryLevelTraitProvider);

  @override
  Widget build(BuildContext context) {
    if (_batteryLevelTraitProvider.isLoading) {
      return CircularProgressIndicator();
    } else if (_batteryLevelTraitProvider.isInErrorState) {
      return Icon(Icons.error);
    } else {
      final batteryLevel = _batteryLevelTraitProvider.getBatteryLevel;
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                _batteryLevelTraitProvider.displayName,
                style: Theme.of(context).textTheme.headline6,
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
                width: 100.0,
                height: 100.0,
                child: BatteryLevelIcon(
                  batteryLevel,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Battery Level: $batteryLevel%",
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.normal),
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
      return Colors.white;
    }
  }
}
