import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/color_temperature_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as sdk;

class DeviceItemIcon {
  static Widget getIcon(List<sdk.Trait> traits) {
    try {
      sdk.Trait determiningTrait = traits[0];
      switch (determiningTrait.runtimeType) {
        case sdk.LockTrait:
          return LockIcon(
              findIconStateValue<sdk.IsLocked, bool>(determiningTrait.states));
        case sdk.ThermostatTrait:
          return ThermostatIcon(
              thermostatState:
                  findIconStateValue<sdk.TargetTemperature, double?>(
                      determiningTrait.states));
        case sdk.PowerTrait:
          return PowerItemIcon(
              findIconStateValue<sdk.IsOnOff, bool>(determiningTrait.states));
        case sdk.BatteryLevelTrait:
          return BatteryLevelIcon(findIconStateValue<sdk.BatteryLevel, int>(
              determiningTrait.states));
        case sdk.ColorTemperatureTrait:
          return ColorTemperatureIcon(
              findIconStateValue<sdk.ColorTemperature, int>(
                  determiningTrait.states));
        default:
          return UnknownItemIcon();
      }
    } catch (e) {
      return UnknownItemIcon();
    }
  }

  static S findIconStateValue<T extends sdk.State<dynamic>, S>(
      Set<sdk.State> states) {
    return states.firstWhere((state) => state is T).value;
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
