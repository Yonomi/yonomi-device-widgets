import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/components/arc.dart';
import 'package:yonomi_device_widgets/components/device_control.dart';
import 'package:yonomi_device_widgets/components/modes_toolbar.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ThermostatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thermostatProvider =
        Provider.of<ThermostatProvider>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Text(
              thermostatProvider.deviceDetail?.displayName ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ModesToolbar(deviceId: thermostatProvider.deviceDetail?.id)),
        SizedBox(
          height: WidgetStyleConstants.defaultDeviceIconSize,
        ),
        Center(
            child: Arc(
          centerWidget: Text(
            thermostatProvider.targetTemperature.toInt().toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
          initialValue: 20.0,
          onFinalSetPoint: (double temperature) {
            print('Printing temperature');
            // thermostatProvider.setPointAction(deviceId, temperature);
            // data.setPointAction(deviceId, temperature);
          },
          maxValue: 50,
        )),
        SizedBox(
          height: 30,
        ),
        DeviceControl(onOff: true)
      ],
    );
  }
}
