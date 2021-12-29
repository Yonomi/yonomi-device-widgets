import 'package:flutter/cupertino.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/traits/expandable/device_expand_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';

class PowerExpandWidget extends DeviceExpandWidget {
  PowerExpandWidget(PowerTraitProvider _powerProvider,
      {Color? backgroundColor, Key? key})
      : super(
            leftIcon: PowerItemIcon(_powerProvider.getOnOffState,
                size: 20.0,
                color: WidgetStyleConstants.deviceDetailIconColorActive),
            rightIcon: CupertinoSwitch(
              activeColor: WidgetStyleConstants.traitDetailSwitchPressedColor,
              onChanged: (bool onOff) {
                _powerProvider.sendPowerOnOffAction(onOff);
              },
              value: _powerProvider.getOnOffState,
            ),
            headerText: Text(
                _powerProvider.getPowerTrait()?.name ?? 'Power Switch',
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            backgroundColor: backgroundColor,
            key: key);
}
