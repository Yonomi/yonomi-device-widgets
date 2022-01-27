import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ThermostatWidget extends StatelessWidget {
  final ThermostatProvider _thermostatProvider;

  late final Color _textColor;

  ThermostatWidget(this._thermostatProvider,
      {Color textColor = WidgetStyleConstants.darkTextColor, Key? key})
      : super(key: key) {
    this._textColor = textColor;
  }

  Widget _centerText(TextStyle? style) {
    return Row(children: [
      Icon(
        BootstrapIcons.thermometer,
        size: style?.height,
        color: style?.color,
      ),
      Text(
        '${_thermostatProvider.targetTemperature.toInt()}\u{00B0}',
        style: style,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Text(
              _thermostatProvider.displayName,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: _textColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _centerText(Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: _textColor)),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}