import 'package:flutter/cupertino.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class LockIcon extends StatelessWidget {
  late final double _size;
  late final Color _color;
  late final bool _locked;

  LockIcon(bool isLocked,
      {size = WidgetStyleConstants.defaultDeviceIconSize,
      color = WidgetStyleConstants.deviceIconColor,
      Key? key})
      : super(key: key) {
    this._size = WidgetStyleConstants.defaultDeviceIconSize;
    this._color = WidgetStyleConstants.deviceIconColor;
    this._locked = isLocked;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(_locked ? BootstrapIcons.lock : BootstrapIcons.unlock,
        size: _size, color: _color);
  }
}
