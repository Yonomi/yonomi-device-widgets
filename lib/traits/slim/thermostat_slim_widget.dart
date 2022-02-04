import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ThermostatSlimWidget extends BaseSlimWidget {
  ThermostatSlimWidget(ThermostatProvider thermostatProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: thermostatProvider,
            leftIcon: Icon(BootstrapIcons.thermometer,
                size: 20.0,
                color: WidgetStyleConstants.deviceDetailIconColorActive),
            headerText: Text(
                'Target Temperature: ${thermostatProvider.getTargetTemperatureState.toInt()}\u{00B0}',
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            backgroundColor: backgroundColor,
            createContent: (context) => Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Fan: ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: WidgetStyleConstants.darkTextColor),
                        ),
                        Text(thermostatProvider.getFanModeState,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: WidgetStyleConstants.darkTextColor,
                                    fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Fan Modes: ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: WidgetStyleConstants.darkTextColor),
                        ),
                        Text(
                            thermostatProvider.getAvailableFanModes
                                .map((mode) => mode.name)
                                .join(', '),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: WidgetStyleConstants.darkTextColor,
                                    fontWeight: FontWeight.normal))
                      ],
                    ),
                  ],
                ),
            key: key);
}
