import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ThermostatIcon extends StatelessWidget {
  late final String _thermostatState;
  late final Decoration _decoration;
  late final TextStyle _textStyle;

  ThermostatIcon(
      {double? thermostatState,
      Decoration? decoration,
      TextStyle? textStyle,
      Key? key})
      : super(key: key) {
    this._thermostatState = thermostatState?.round().toString() ?? 'N/A';
    this._decoration = decoration ??
        BoxDecoration(
            borderRadius: WidgetStyleConstants.defaultCircularBorderRadius,
            border: Border.all(
                width: WidgetStyleConstants.defaultBorderWidth,
                color: WidgetStyleConstants.defaultBorderColor));
    this._textStyle =
        textStyle ?? WidgetStyleConstants.deviceItemTextPrimaryState;
  }

  String get state => _thermostatState;

  Decoration get decoration => _decoration;

  TextStyle get textStyle => _textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      child: Center(
        child: Text(
          _thermostatState,
          style: _textStyle,
        ),
      ),
    );
  }
}
