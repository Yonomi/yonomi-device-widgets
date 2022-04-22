import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/brightness_widget.dart';
import 'package:yonomi_device_widgets/traits/color_temperature_widget.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/brightness_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/color_temperature_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/unknown_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_device_widgets/traits/unknown_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceWidgetFactory {
  static Widget produceWidget(
    Trait trait, {
    Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
    Color textColor = WidgetStyleConstants.deviceDetailIconColorActive,
  }) {
    switch (trait.runtimeType) {
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
            return ThermostatWidget(
              thermostatProvider,
              textColor: textColor,
            );
          },
        );
      case BrightnessTrait:
        return Consumer<BrightnessProvider>(
          builder: (_, brightnessProvider, __) {
            return BrightnessWidget(brightnessProvider, textColor: textColor);
          },
        );
      case ColorTemperatureTrait:
        return Consumer<ColorTemperatureProvider>(
          builder: (_, ColorTemperatureProvider, __) {
            return ColorTemperatureWidget(ColorTemperatureProvider,
                textColor: textColor);
          },
        );
      default:
        return UnknownWidget(name: trait.name, iconColor: iconColor);
    }
  }

  static Widget produceSlimWidget(Trait trait,
      {backgroundColor = Colors.white}) {
    switch (trait.runtimeType) {
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
      case BrightnessTrait:
        return Consumer<BrightnessProvider>(
            builder: (_, brightnessProvider, __) {
          return BrightnessSlimWidget(
            brightnessProvider,
            backgroundColor: backgroundColor,
          );
        });
      case ColorTemperatureTrait:
        return Consumer<ColorTemperatureProvider>(
            builder: (_, ColorTemperatureProvider, __) {
          return ColorTemperatureSlimWidget(
            ColorTemperatureProvider,
            backgroundColor: backgroundColor,
          );
        });
      default:
        return UnknownSlimWidget(trait.name, backgroundColor: backgroundColor);
    }
  }
}
