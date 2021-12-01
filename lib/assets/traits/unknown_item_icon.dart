import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class UnknownItemIcon extends StatelessWidget {
  late final double _size;
  late final Color _color;

  UnknownItemIcon(
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor])
      : super() {
    this._size = WidgetStyleConstants.defaultDeviceIconSize;
    this._color = WidgetStyleConstants.deviceIconColor;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(BootstrapIcons.box, size: _size, color: _color);
  }
}
