import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';
import 'package:built_value/built_value.dart';

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
            createContent: (context) => _content(context, thermostatProvider),
            key: key);

  static Widget _content(
      BuildContext context, ThermostatProvider thermostatProvider) {
    return Column(children: [
      Row(children: [
        Text(
            'Ambient Temperature: ${thermostatProvider.getAmbientTemperatureState.toInt()}\u{00B0}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: WidgetStyleConstants.darkTextColor))
      ]),
      _chipList<AvailableThermostatMode>(
          context,
          'Modes: ',
          thermostatProvider,
          thermostatProvider.getAvailableThermostatModes.toList(),
          thermostatProvider.getModeState,
          thermostatProvider.setThermostatMode,
          'modeChip'),
      _chipList<AvailableFanMode>(
          context,
          'Fan Modes: ',
          thermostatProvider,
          thermostatProvider.getAvailableFanModes.toList(),
          thermostatProvider.getFanModeState,
          thermostatProvider.setFanMode,
          'fanModeChip'),
    ]);
  }

  static Widget _chipList<T extends EnumClass>(
      BuildContext context,
      String label,
      ThermostatProvider thermostatProvider,
      List<T> values,
      T selectedValue,
      Function clickAction,
      String keyName) {
    return Wrap(
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
                    ?.copyWith(color: WidgetStyleConstants.darkTextColor),
              )),
          ...List<Widget>.generate(
            values.length,
            (int index) {
              return ChoiceChip(
                  visualDensity: VisualDensity.comfortable,
                  padding: EdgeInsets.only(right: -1.0, left: -1.0),
                  labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
                  label: Text('${values[index].name}'),
                  selected: selectedValue == values[index],
                  onSelected: (bool selected) {
                    if (selected) {
                      _doTap(thermostatProvider, values[index]);
                    }
                  },
                  key: Key('$keyName-${values[index].name}'));
            },
          ).toList()
        ]);
  }

  static Future<void>? _doTap<T>(
      ThermostatProvider thermostatProvider, T value) {
    final deviceId = thermostatProvider.deviceDetail?.id ?? '';
    switch (T) {
      case AvailableThermostatMode:
        return thermostatProvider.setThermostatMode(
            deviceId, value as AvailableThermostatMode);
      case AvailableFanMode:
        return thermostatProvider.setFanMode(
            deviceId, value as AvailableFanMode);
    }
  }
}
