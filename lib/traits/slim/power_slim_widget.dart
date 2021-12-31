import 'package:flutter/cupertino.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/traits/slim/device_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';

class PowerSlimWidget extends DeviceSlimWidget {
  PowerSlimWidget(PowerTraitProvider _powerProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: _powerProvider,
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
