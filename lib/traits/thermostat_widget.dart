import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';
import 'package:flutter/src/widgets/framework.dart' as framework;

class ThermostatWidget extends StatelessWidget with ToastNotifications {
  final ThermostatProvider _thermostatProvider;

  late final Color _textColor;

  ThermostatWidget(this._thermostatProvider,
      {Color textColor = WidgetStyleConstants.darkTextColor, Key? key})
      : super(key: key) {
    this._textColor = textColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_thermostatProvider.isBusy) {
      return CircularProgressIndicator();
    } else if (_thermostatProvider.isInErrorState) {
      showToast(context, _thermostatProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[_displayName(context)],
          ),
          Row(
            children: <Widget>[_modeStateText(context)],
          ),
          SizedBox(height: 8.0),
          _modeBar(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _centerTempText(context),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _setTemperature(),
              )
            ],
          ),
          _fanMode(context),
        ],
      );
    }
  }

  Widget _setTemperature() {
    final currentMode = _thermostatProvider.getModeState;
    if (!(currentMode == AvailableThermostatMode.COOL ||
        currentMode == AvailableThermostatMode.HEAT)) {
      return Container();
    }
    final isCool = currentMode == AvailableThermostatMode.COOL;
    final temperatureRange = isCool
        ? _thermostatProvider.getCoolTemperatureRange!
        : _thermostatProvider.getHeatTemperatureRange!;
    double value = _thermostatProvider.getTargetTemperatureState!;

    if ((value < temperatureRange.min)) {
      value = temperatureRange.min;
    }

    if ((value > temperatureRange.max)) {
      value = temperatureRange.max;
    }

    return TemperatureRangeSlider(
      value,
      temperatureRange.min,
      temperatureRange.max,
      isCool,
      (value) {
        // Add 1s delay
        Future.delayed(Duration(seconds: 1), () {
          _thermostatProvider.setPointAction(
              _thermostatProvider.deviceDetail!.id, value);
        });
      },
    );
  }

  Widget _fanMode(BuildContext context) {
    final selectedFanMode = _thermostatProvider.getFanModeState;
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: _textColor)),
        color: Colors.white,
        margin: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ExpansionTile(
              initiallyExpanded: false,
              childrenPadding: EdgeInsets.all(8.0),
              leading: (_thermostatProvider.isPerformingAction)
                  ? CircularProgressIndicator()
                  : Icon(
                      BootstrapIcons.fan,
                      color: _textColor,
                    ),
              backgroundColor: Colors.white,
              title: Text(
                "Fan: $selectedFanMode",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: _textColor),
              ),
              tilePadding: EdgeInsets.all(0.0),
              children: [_fanModes(context)],
              collapsedIconColor: WidgetStyleConstants.globalSuccessColor,
              iconColor: WidgetStyleConstants.deviceIconColor,
              key: key,
            )));
  }

  Widget _fanModes(BuildContext context) {
    final availableFanModes = _thermostatProvider.getAvailableFanModes.toList();

    return Wrap(
      spacing: 5.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Modes: ",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: _textColor),
            )),
        ...List<ChoiceChip>.generate(
          availableFanModes.length,
          (int index) {
            return ChoiceChip(
                labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
                label: Text('${availableFanModes[index].name}'),
                selected: _thermostatProvider.getFanModeState ==
                    availableFanModes[index],
                onSelected: (bool selected) {
                  if (selected) {
                    _thermostatProvider.setFanMode(
                        _thermostatProvider.deviceDetail?.id ?? '',
                        availableFanModes[index]);
                  }
                },
                key: Key('fanModeChip-${availableFanModes[index].name}'));
          },
        ).toList(),
      ],
    );
  }

  Widget _modeStateText(BuildContext context) {
    return Text(
      _thermostatProvider.getModeState.name,
      style: TextStyle(color: WidgetStyleConstants.globalSuccessColor),
      textAlign: TextAlign.left,
    );
  }

  Widget _centerTempText(BuildContext context) {
    final TextStyle? targetTextStyle =
        Theme.of(context).textTheme.headline2?.copyWith(color: _textColor);

    final TextStyle? ambientTextStyle =
        Theme.of(context).textTheme.headline4?.copyWith(color: _textColor);

    final TextStyle? subtitleTextStyle =
        Theme.of(context).textTheme.headline6?.copyWith(color: _textColor);

    return Column(children: [
      Row(children: [
        Icon(
          BootstrapIcons.thermometer,
          size: targetTextStyle?.height,
          color: targetTextStyle?.color,
        ),
        Text(
          '${_thermostatProvider.getTargetTemperatureState?.toInt() ?? "--"}\u{00B0}',
          style: targetTextStyle,
        )
      ]),
      Text(
        'TARGET',
        style: subtitleTextStyle,
      ),
      Row(children: [
        Icon(
          BootstrapIcons.thermometer,
          size: ambientTextStyle?.height,
          color: ambientTextStyle?.color,
        ),
        Text(
          '${_thermostatProvider.getAmbientTemperatureState?.toInt() ?? "--"}\u{00B0}',
          style: ambientTextStyle,
        )
      ]),
      Text(
        'AMBIENT',
        style: subtitleTextStyle,
      ),
    ]);
  }

  Widget _displayName(BuildContext context) {
    return Text(
      _thermostatProvider.displayName,
      style: Theme.of(context).textTheme.headline6?.copyWith(color: _textColor),
      textAlign: TextAlign.center,
    );
  }

  Widget _modeBar(BuildContext context) {
    final selectedMode = _thermostatProvider.getModeState;
    final availableModes =
        _thermostatProvider.getAvailableThermostatModes.toList();

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          availableModes.length,
          (int index) {
            Color color = (availableModes[index] == selectedMode)
                ? WidgetStyleConstants.globalSuccessColor
                : _textColor;
            return ChoiceChip(
              label: _modeBarIcon(availableModes[index], color),
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              selected: selectedMode == availableModes[index],
              shape: CircleBorder(side: BorderSide(width: 2, color: color)),
              onSelected: (bool selected) {
                if (selected) {
                  _thermostatProvider.setThermostatMode(
                      _thermostatProvider.deviceDetail?.id ?? '',
                      availableModes[index]);
                }
              },
            );
          },
        ));
  }

  Widget _modeBarIcon(AvailableThermostatMode mode, Color color) {
    final iconSize = 30.0;
    switch (mode) {
      case AvailableThermostatMode.COOL:
        return Icon(Icons.ac_unit,
            color: color, size: iconSize, semanticLabel: mode.name);
      case AvailableThermostatMode.HEAT:
        return Icon(Icons.whatshot,
            color: color, size: iconSize, semanticLabel: mode.name);
      case AvailableThermostatMode.OFF:
        return Icon(BootstrapIcons.power,
            color: color, size: iconSize, semanticLabel: mode.name);
      case AvailableThermostatMode.FANONLY:
        return Icon(BootstrapIcons.fan,
            color: color, size: iconSize, semanticLabel: mode.name);
      case AvailableThermostatMode.AIRFLOW:
        return Icon(Icons.air,
            color: color, size: iconSize, semanticLabel: mode.name);
      case AvailableThermostatMode.DEHUMIDIFY:
        return Icon(
          Icons.water,
          color: color,
          size: iconSize,
          semanticLabel: mode.name,
        );
      default:
        return SizedBox(
            child: Text(
              mode.name.characters.first.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: iconSize - 6,
              ),
              semanticsLabel: mode.name,
            ),
            width: iconSize,
            key: Key('defaultModeIcon-${mode.name}'));
    }
  }
}

class TemperatureRangeSlider extends StatefulWidget {
  late final sliderValue;
  late final min;
  late final max;
  late final isCool;
  late final onChangeEnd;

  TemperatureRangeSlider(double sliderValue, double min, double max,
      bool isCool, void Function(double)? onChangeEnd,
      {Key? key})
      : super(key: key) {
    this.sliderValue = sliderValue;
    this.min = min;
    this.max = max;
    this.isCool = isCool;
    this.onChangeEnd = onChangeEnd;
  }

  @override
  framework.State<TemperatureRangeSlider> createState() =>
      _TemperatureRangeSlider(sliderValue, min, max, isCool, onChangeEnd);
}

class _TemperatureRangeSlider extends framework.State<TemperatureRangeSlider> {
  late double _currentSliderValue;
  late final min;
  late final max;
  late final isCool;
  late final onChangeEnd;

  _TemperatureRangeSlider(double sliderValue, double min, double max,
      bool isCool, void Function(double)? onChangeEnd) {
    this._currentSliderValue = sliderValue;
    this.min = min;
    this.max = max;
    this.isCool = isCool;
    this.onChangeEnd = onChangeEnd;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      label: _currentSliderValue.round().toString(),
      min: min,
      max: max,
      divisions: 100,
      thumbColor: isCool ? Colors.blue : Colors.red,
      onChangeEnd: onChangeEnd,
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
