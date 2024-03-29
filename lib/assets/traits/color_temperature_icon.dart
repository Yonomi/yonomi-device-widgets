import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ColorTemperatureIcon extends Icon {
  static const DEFAULT_ICON = BootstrapIcons.lightbulb;

  ColorTemperatureIcon(int colorTemperature,
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(DEFAULT_ICON, key: key, size: size, color: color);
}
