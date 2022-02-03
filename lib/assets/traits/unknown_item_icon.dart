import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class UnknownItemIcon extends Icon {
  UnknownItemIcon(
      {double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(BootstrapIcons.box, key: key, size: size, color: color);
}
