import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class ColorTemperatureWidget extends StatefulWidget {
  final ColorTemperatureProvider _colorTemperatureProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  static const String label = 'Color Temp.';

  ColorTemperatureWidget(this._colorTemperatureProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.darkTextColor,
      double iconSize = 100,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._iconSize = iconSize;
  }

  @override
  State<StatefulWidget> createState() => _ColorTemperatureWidgetState();
}

class _ColorTemperatureWidgetState extends State<ColorTemperatureWidget>
    with ToastNotifications {
  int? _value;

  static const double DEFAULT_COLOR_TEMP = 2500;
  static const double DEFAULT_MIN_COLOR_TEMP = 1000;
  static const double DEFAULT_MAX_COLOR_TEMP = 7000;

  @override
  void initState() {
    super.initState();
    _value = widget._colorTemperatureProvider.getColorTemperatureState;
  }

  @override
  Widget build(BuildContext context) {
    if (widget._colorTemperatureProvider.isLoading) {
      return CircularProgressIndicator();
    } else if (widget._colorTemperatureProvider.isInErrorState) {
      showToast(context, widget._colorTemperatureProvider.getErrorMessage);
      return Icon(
        Icons.error,
        color: WidgetStyleConstants.globalWarningColor,
      );
    } else {
      final colorTemperature = _colorTemperatureValue();
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  ColorTemperatureWidget.label.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: widget._textColor),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: Center(
                  child: SizedBox(
                width: widget._iconSize,
                height: widget._iconSize,
                child: widget._colorTemperatureProvider.isPerformingAction
                    ? CircularProgressIndicator()
                    : Icon(
                        BootstrapIcons.box,
                        color: widget._iconColor,
                        size: widget._iconSize,
                      ),
              )),
            ),
            SizedBox(height: 10),
            Row(children: [
              Icon(
                BootstrapIcons.thermometer_sun,
                color: widget._iconColor,
              ),
              Expanded(
                child: Slider(
                  label: ColorTemperatureWidget.label,
                  value: colorTemperature?.toDouble() ?? DEFAULT_COLOR_TEMP,
                  min: widget._colorTemperatureProvider.getMinColorTemperature
                          ?.toDouble() ??
                      DEFAULT_MIN_COLOR_TEMP,
                  max: widget._colorTemperatureProvider.getMaxColorTemperature
                          ?.toDouble() ??
                      DEFAULT_MAX_COLOR_TEMP,
                  divisions: 100,
                  activeColor: WidgetStyleConstants.globalSuccessColor,
                  // When onChanged is null it makes the slider disabled
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
              ),
              Text(
                '${colorTemperature ?? "--"}',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: widget._textColor),
              )
            ])
          ]);
    }
  }

  int? _colorTemperatureValue() {
    if (_value == null) {
      setState(() {
        _value = widget._colorTemperatureProvider.getColorTemperatureState;
        super.reassemble();
      });
    }
    return _value;
  }
}
