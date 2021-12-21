import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';

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
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                'BATTERY',
                style: Theme.of(context).textTheme.headline6,
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
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Battery Level: ${_batteryLevelTraitProvider.getBatteryLevel}",
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.normal),
            ),
          ]);
    }
  }
}
