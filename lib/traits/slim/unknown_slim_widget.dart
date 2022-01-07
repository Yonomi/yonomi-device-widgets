import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/traits/slim/device_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class UnknownSlimWidget extends DeviceSlimWidget {
  UnknownSlimWidget(String headerText, {Color? backgroundColor, Key? key})
      : super(
            leftIcon: UnknownItemIcon(
                size: 20.0,
                color: WidgetStyleConstants.deviceDetailIconColorActive),
            headerText: Text(headerText,
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            backgroundColor: backgroundColor,
            key: key);
}
