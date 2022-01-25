import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';

class PowerSlimWidget extends BaseSlimWidget {
  PowerSlimWidget(PowerTraitProvider powerProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: powerProvider,
            leftIcon: IconButton(
              icon: PowerItemIcon(powerProvider.getOnOffState,
                  size: 20.0,
                  color: WidgetStyleConstants.deviceDetailIconColorActive),
              iconSize: 20.0,
              onPressed: () => powerProvider
                  .sendPowerOnOffAction(!powerProvider.getOnOffState),
            ),
            rightIcon: (powerProvider.supportsDiscreteOnOff)
                ? CupertinoSwitch(
                    activeColor:
                        WidgetStyleConstants.traitDetailSwitchPressedColor,
                    onChanged: (bool onOff) {
                      powerProvider.sendPowerOnOffAction(onOff);
                    },
                    value: powerProvider.getOnOffState,
                  )
                : null,
            headerText: Text(powerProvider.deviceDetail?.displayName ?? 'POWER',
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            backgroundColor: backgroundColor,
            key: key);
}
