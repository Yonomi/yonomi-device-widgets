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
                    Row(children: [
                      Text(
                        'Modes: ',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: WidgetStyleConstants.darkTextColor),
                      ),
                      ...List<Widget>.generate(
                        thermostatProvider.getAvailableThermostatModes.length,
                        (int index) {
                          return ChoiceChip(
                            labelPadding:
                                EdgeInsets.only(right: 5.0, left: 5.0),
                            label: Text(
                                '${thermostatProvider.getAvailableThermostatModes.toList()[index].name}'),
                            selected: thermostatProvider.getModeState ==
                                thermostatProvider.getAvailableThermostatModes
                                    .toList()[index],
                            onSelected: (bool selected) {
                              if (selected) {
                                thermostatProvider.setThermostatMode(
                                    thermostatProvider.deviceDetail?.id ?? '',
                                    thermostatProvider
                                        .getAvailableThermostatModes
                                        .toList()[index]);
                              }
                            },
                          );
                        },
                      ).toList(),
                    ]),
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
                        ...List<Widget>.generate(
                          thermostatProvider.getAvailableFanModes.length,
                          (int index) {
                            return ChoiceChip(
                              labelPadding:
                                  EdgeInsets.only(right: 5.0, left: 5.0),
                              label: Text(
                                  '${thermostatProvider.getAvailableFanModes.toList()[index].name}'),
                              selected: thermostatProvider.getFanModeState ==
                                  thermostatProvider.getAvailableFanModes
                                      .toList()[index],
                              onSelected: (bool selected) {
                                if (selected) {
                                  thermostatProvider.setFanMode(
                                      thermostatProvider.deviceDetail?.id ?? '',
                                      thermostatProvider.getAvailableFanModes
                                          .toList()[index]);
                                }
                              },
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ],
                ),
            key: key);
}
