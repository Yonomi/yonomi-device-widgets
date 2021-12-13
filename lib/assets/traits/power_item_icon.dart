import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PowerItemIcon extends Icon {
  PowerItemIcon(bool isOnOff,
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(isOnOff ? BootstrapIcons.box : BootstrapIcons.box,
            key: key, size: size, color: color);
}
