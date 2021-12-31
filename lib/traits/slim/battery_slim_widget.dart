import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/traits/slim/device_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BatterySlimWidget extends DeviceSlimWidget {
  BatterySlimWidget(_batteryLevelTraitProvider,
      {Color? backgroundColor, Key? key})
      : super(
          backgroundColor: backgroundColor,
          leftIcon:
              _getBatteryLevelIcon(_batteryLevelTraitProvider.getBatteryLevel),
          headerText: Text(
              'Battery Level: ${_batteryLevelTraitProvider.getBatteryLevel}%',
              style: TextStyle(
                  fontSize: 20,
                  color: _getBatteryLevelTextColor(
                      _batteryLevelTraitProvider.getBatteryLevel))),
        );

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }

  static BatteryLevelIcon _getBatteryLevelIcon(int batteryLevel) {
    return BatteryLevelIcon(
      batteryLevel,
      size: 20.0,
      color: WidgetStyleConstants.deviceDetailIconColorActive,
    );
  }

  static Color _getBatteryLevelTextColor(int batteryLevel) {
    if (batteryLevel >= WidgetStyleConstants.batteryFullMin) {
      return WidgetStyleConstants.globalSuccessColor;
    } else if (batteryLevel <= WidgetStyleConstants.batteryLowMax) {
      return WidgetStyleConstants.globalWarningColor;
    } else {
      return WidgetStyleConstants.darkTextColor;
    }
  }
}
