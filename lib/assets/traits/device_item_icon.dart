import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceItemIcon {
  static Widget getIcon(List<Trait> traits) {
    Trait determiningTrait = traits[0];
    switch (determiningTrait.runtimeType) {
      case LockTrait:
        return LockIcon(determiningTrait.state.value);
      case ThermostatTrait:
        return ThermostatIcon(thermostatState: determiningTrait.state.value);
      case PowerTrait:
        return PowerItemIcon(determiningTrait.state.value);
      default:
        return UnknownItemIcon();
    }
  }

  static buildLockUnlockIcon(bool isLocked,
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor]) {
    return LockIcon(
      isLocked,
      size: size,
      color: color,
    );
  }
}
