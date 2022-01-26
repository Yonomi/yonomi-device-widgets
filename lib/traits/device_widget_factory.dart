import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/unknown_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_device_widgets/traits/unknown_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceWidgetFactory<T extends Trait> {
  static Widget produceWidget<T extends Trait>(
      {String? name,
      Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
    switch (T) {
      case LockTrait:
        return Consumer<LockProvider>(builder: (_, lockProvider, __) {
          return LockWidget(lockProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case PowerTrait:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, __) {
          return PowerWidget(powerProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case BatteryLevelTrait:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, __) {
          return BatteryWidget(batteryLevelProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case ThermostatTrait:
        return Consumer<ThermostatProvider>(
          builder: (_, thermostatProvider, __) {
            return ThermostatWidget(thermostatProvider, textColor: textColor);
          },
        );
      default:
        return UnknownWidget(name: name, iconColor: iconColor);
    }
  }

  static Widget produceSlimWidget<T extends Trait>(
      {String? name, backgroundColor = Colors.white}) {
    switch (T) {
      case LockTrait:
        return Consumer<LockProvider>(builder: (_, lockProvider, __) {
          return LockSlimWidget(lockProvider, backgroundColor: backgroundColor);
        });
      case PowerTrait:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, __) {
          return PowerSlimWidget(powerProvider,
              backgroundColor: backgroundColor);
        });
      case BatteryLevelTrait:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, __) {
          return BatterySlimWidget(batteryLevelProvider,
              backgroundColor: backgroundColor,
              createContent: (context) => BatteryWidget(
                    batteryLevelProvider,
                    iconSize: 100.0,
                    textColor: WidgetStyleConstants.darkTextColor,
                    iconColor: WidgetStyleConstants.deviceDetailIconColorActive,
                  ));
        });
      case ThermostatTrait:
        return Consumer<ThermostatProvider>(
            builder: (_, thermostatProvider, __) {
          return ThermostatSlimWidget(
            thermostatProvider,
            backgroundColor: backgroundColor,
          );
        });
      default:
        return UnknownSlimWidget(name ?? '', backgroundColor: backgroundColor);
    }
  }
}
