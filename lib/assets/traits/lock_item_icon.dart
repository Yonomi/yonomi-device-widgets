import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockIcon extends Icon {

  LockIcon(bool isLocked,
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(isLocked ? BootstrapIcons.lock : BootstrapIcons.unlock,
            key: key, size: size, color: color);
}
