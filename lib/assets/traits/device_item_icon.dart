import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceItemIcon {
  static Widget getIcon(List<Trait> traits) {
    Trait determiningTrait = traits[0];
    if (determiningTrait is LockTrait) {
      return LockIcon(determiningTrait.state.value);
    } else if (determiningTrait is ThermostatTrait) {
      return buildThermostatIcon(determiningTrait.state.value);
    } else {
      return UnknownItemIcon();
    }
  }

  static Widget buildLockIcon(
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor]) {
    print('REACHED BUILD LOCK ICON');
    return LockIcon(
      true,
      size: size,
      color: color,
    );
  }

  static Widget buildUnlockIcon(
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor]) {
    print('REACHED BUILD UNLOCK ICON');

    return LockIcon(
      false,
      size: size,
      color: color,
    );
  }

  static Widget buildThermostatIcon(double? thermostatState) {
    return ThermostatIcon(thermostatState: thermostatState);
  }
}
