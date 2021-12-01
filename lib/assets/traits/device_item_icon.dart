import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceItemIcon {
  static Widget getIcon(List<Trait> traits) {
    Trait determiningTrait = traits[0];
    if (determiningTrait is LockTrait) {
      return (determiningTrait.state.value)
          ? buildLockIcon()
          : buildUnlockIcon();
    } else if (determiningTrait is ThermostatTrait) {
      return buildThermostatIcon(determiningTrait.state.value);
    } else {
      return UnknownItemIcon();
    }
  }

  static Widget buildLockIcon(
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor]) {
    return Icon(
      Icons.lock,
      size: size,
      color: color,
    );
  }

  static Widget buildUnlockIcon(
      [double size = WidgetStyleConstants.defaultDeviceIconSize,
      Color color = WidgetStyleConstants.deviceIconColor]) {
    return Icon(
      Icons.lock_open,
      size: size,
      color: color,
    );
  }

  static Widget buildThermostatIcon(double? thermostatState) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 3, color: Colors.black)),
      child: Center(
        child: Text(
          (thermostatState != null)
              ? thermostatState.round().toString()
              : 'N/A',
          style: WidgetStyleConstants.deviceItemTextPrimaryState,
        ),
      ),
    );
  }
}
