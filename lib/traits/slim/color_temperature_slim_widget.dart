import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ColorTemperatureSlimWidget extends StatefulWidget {
  final ColorTemperatureProvider _colorTemperatureProvider;
  late final Color _iconColor;
  late final Color _backgroundColor;

  static const String label = 'Color Temp.';

  ColorTemperatureSlimWidget(this._colorTemperatureProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Key? key,
      Color backgroundColor = Colors.white70})
      : super(key: key) {
    _iconColor = iconColor;
    _backgroundColor = backgroundColor;
  }

  @override
  State<StatefulWidget> createState() => _ColorTemperatureSlimWidgetState();
}

class _ColorTemperatureSlimWidgetState
    extends State<ColorTemperatureSlimWidget> {
  static const double DEFAULT_COLOR_TEMP = 2500;
  static const double DEFAULT_MIN_COLOR_TEMP = 1000;
  static const double DEFAULT_MAX_COLOR_TEMP = 7000;

  int? _value;

  @override
  void initState() {
    super.initState();
    _value = widget._colorTemperatureProvider.getColorTemperatureState;
  }

  @override
  Widget build(BuildContext context) {
    final colorTemperature = _colorTemperatureValue();
    return ListTile(
<<<<<<< Updated upstream
        tileColor: widget._backgroundColor,
        leading: (widget._colorTemperatureProvider.isPerformingAction ||
                widget._colorTemperatureProvider.isLoading)
            ? CircularProgressIndicator()
=======
        horizontalTitleGap: 16.0,
        contentPadding: EdgeInsets.all(0),
        tileColor: widget._backgroundColor,
        leading: (widget._colorTemperatureProvider.isPerformingAction ||
                widget._colorTemperatureProvider.isLoading)
            ? SizedBox(
                child: CircularProgressIndicator(), height: 20, width: 20)
>>>>>>> Stashed changes
            : Icon(BootstrapIcons.box, color: widget._iconColor),
        title: Slider(
          label: ColorTemperatureSlimWidget.label,
          value: colorTemperature?.toDouble() ?? DEFAULT_COLOR_TEMP,
          min: widget._colorTemperatureProvider.getMinColorTemperature
                  ?.toDouble() ??
              DEFAULT_MIN_COLOR_TEMP,
          max: widget._colorTemperatureProvider.getMaxColorTemperature
                  ?.toDouble() ??
              DEFAULT_MAX_COLOR_TEMP,
          divisions: 100,
          activeColor: WidgetStyleConstants.globalSuccessColor,
          onChanged: (colorTemperature == null)
              ? null
              : (double value) {
                  setState(() => _value = value.toInt());
                }, // Required
          onChangeEnd: (double value) {
            // Only send the update when user releases slider
            setState(() => _value = value.toInt());
            widget._colorTemperatureProvider
                .setColorTemperatureAction(value.round());
          },
        ),
        trailing: Text('${colorTemperature ?? "--"}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: widget._iconColor)));
  }

  int? _colorTemperatureValue() {
    if (_value == null) {
      setState(() {
        _value = widget._colorTemperatureProvider.getColorTemperatureState;
      });
    }
    return _value;
  }
}
