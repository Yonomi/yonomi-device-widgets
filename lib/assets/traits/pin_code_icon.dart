import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PinCodeIcon extends Icon {
  static const DEFAULT_ICON = BootstrapIcons.grid_3x3_gap_fill;

  PinCodeIcon(
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(DEFAULT_ICON, key: key, size: size, color: color);
}
