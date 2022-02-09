import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

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
                    Wrap(
                        spacing: 5.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Modes: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        color:
                                            WidgetStyleConstants.darkTextColor),
                              )),
                          ...List<Widget>.generate(
                            thermostatProvider
                                .getAvailableThermostatModes.length,
                            (int index) {
                              final availableModes = thermostatProvider
                                  .getAvailableThermostatModes
                                  .toList();
                              return ChoiceChip(
                                visualDensity: VisualDensity.comfortable,
                                padding:
                                    EdgeInsets.only(right: -1.0, left: -1.0),
                                labelPadding:
                                    EdgeInsets.only(right: 5.0, left: 5.0),
                                label: Text('${availableModes[index].name}'),
                                selected: thermostatProvider.getModeState ==
                                    thermostatProvider
                                        .getAvailableThermostatModes
                                        .toList()[index],
                                onSelected: (bool selected) {
                                  if (selected) {
                                    thermostatProvider.setThermostatMode(
                                        thermostatProvider.deviceDetail?.id ??
                                            '',
                                        availableModes[index]);
                                  }
                                },
                                key: Key(
                                    'modeChip-${availableModes[index].name}'),
                              );
                            },
                          ).toList(),
                        ]),
                    Wrap(
                      spacing: 5.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Fan Modes: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color:
                                          WidgetStyleConstants.darkTextColor),
                            )),
                        ...List<Widget>.generate(
                          thermostatProvider.getAvailableFanModes.length,
                          (int index) {
                            final availableFanModes = thermostatProvider
                                .getAvailableFanModes
                                .toList();
                            return ChoiceChip(
                                visualDensity: VisualDensity.comfortable,
                                padding:
                                    EdgeInsets.only(right: -1.0, left: -1.0),
                                labelPadding:
                                    EdgeInsets.only(right: 5.0, left: 5.0),
                                label: Text('${availableFanModes[index].name}'),
                                selected: thermostatProvider.getFanModeState ==
                                    thermostatProvider.getAvailableFanModes
                                        .toList()[index],
                                onSelected: (bool selected) {
                                  if (selected) {
                                    thermostatProvider.setFanMode(
                                        thermostatProvider.deviceDetail?.id ??
                                            '',
                                        thermostatProvider.getAvailableFanModes
                                            .toList()[index]);
                                  }
                                },
                                key: Key(
                                    'fanModeChip-${availableFanModes[index].name}'));
                          },
                        ).toList(),
                      ],
                    ),
                  ],
                ),
            key: key);
}
