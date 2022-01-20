import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/unknown_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/unknown_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class DeviceWidgetFactory<T> {
  static Widget produceWidget<T extends DeviceProvider>(
      {String? name,
      Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
    switch (T) {
      case LockProvider:
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return LockWidget(lockProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case PowerTraitProvider:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return PowerWidget(powerProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case BatteryLevelProvider:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, child) {
          return BatteryWidget(batteryLevelProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case ThermostatProvider:
        return Consumer<ThermostatProvider>(
          builder: (_, thermostatProvider, child) {
            return Text('${thermostatProvider.targetTemperature.toInt()}');
          },
        );
      default:
        return UnknownWidget(name: name, iconColor: iconColor);
    }
  }

  static Widget produceSlimWidget<T extends DeviceProvider>(
      {String? name, backgroundColor = Colors.white}) {
    switch (T) {
      case LockProvider:
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return LockSlimWidget(lockProvider, backgroundColor: backgroundColor);
        });
      case PowerTraitProvider:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return PowerSlimWidget(powerProvider,
              backgroundColor: backgroundColor);
        });
      case BatteryLevelProvider:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, child) {
          return BatterySlimWidget(batteryLevelProvider,
              backgroundColor: backgroundColor,
              content: BatteryWidget(
                batteryLevelProvider,
                iconSize: 100.0,
                textColor: WidgetStyleConstants.darkTextColor,
                iconColor: WidgetStyleConstants.deviceDetailIconColorActive,
              ));
        });
      case ThermostatProvider:
        return Consumer<ThermostatProvider>(
          builder: (_, thermostatProvider, child) {
            return BaseSlimWidget(
                leftIcon: Icon(BootstrapIcons.thermometer),
                headerText: Text(
                    'Target Temperature: ${thermostatProvider.targetTemperature.toInt()}'));
          },
        );
      default:
        return UnknownSlimWidget(name ?? '', backgroundColor: backgroundColor);
    }
  }
}
