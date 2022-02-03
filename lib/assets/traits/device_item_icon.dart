import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceItemIcon {
  static Widget getIcon(List<Trait> traits) {
    try {
      Trait determiningTrait = traits[0];
      switch (determiningTrait.runtimeType) {
        case LockTrait:
          return LockIcon(determiningTrait.states
              .firstWhere((state) => state is IsLocked)
              .value);
        case ThermostatTrait:
          return ThermostatIcon(
              thermostatState: determiningTrait.states
                  .firstWhere((state) => state is TargetTemperature)
                  .value);
        case PowerTrait:
          return PowerItemIcon(determiningTrait.states
              .firstWhere((state) => state is IsOnOff)
              .value);
        case BatteryLevelTrait:
          return BatteryLevelIcon(determiningTrait.states
              .firstWhere((state) => state is BatteryLevel)
              .value);
        default:
          return UnknownItemIcon();
      }
    } catch (e) {
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
