import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BatteryLevelIcon extends Icon {
  BatteryLevelIcon(int batteryLevel,
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(_getBatteryLevelIcon(batteryLevel),
            key: key, size: size, color: color);

  static IconData _getBatteryLevelIcon(int batteryLevel) {
    if (batteryLevel >= WidgetStyleConstants.batteryFullMin) {
      return BootstrapIcons.battery_full;
    } else if (batteryLevel <= WidgetStyleConstants.batteryLowMax) {
      return BootstrapIcons.battery;
    } else {
      return BootstrapIcons.battery_half;
    }
  }
}
