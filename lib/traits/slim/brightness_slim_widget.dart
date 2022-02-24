import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BrightnessSlimWidget extends StatefulWidget {
  final BrightnessProvider _brightnessProvider;
  late final Color _iconColor;
  late final Color _backgroundColor;

  BrightnessSlimWidget(this._brightnessProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Key? key,
      Color backgroundColor = Colors.white70})
      : super(key: key) {
    _iconColor = iconColor;
    _backgroundColor = backgroundColor;
  }

  @override
  State<StatefulWidget> createState() => _BrightnessSlimWidgetState(
      _brightnessProvider, _iconColor, _backgroundColor);
}

class _BrightnessSlimWidgetState extends State<BrightnessSlimWidget> {
  final BrightnessProvider _brightnessProvider;
  final Color _iconColor;
  final Color _backgroundColor;
  int? _value;

  _BrightnessSlimWidgetState(
      this._brightnessProvider, this._iconColor, this._backgroundColor) {
    _value = _brightnessProvider.getBrightnessState;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: _backgroundColor,
        leading: (_brightnessProvider.isPerformingAction ||
                _brightnessProvider.isLoading)
            ? CircularProgressIndicator()
            : Icon(BootstrapIcons.sun, color: _iconColor),
        title: Slider(
          label: 'Brightness',
          value: _brightnessProvider.getBrightnessState?.toDouble() ?? 50.0,
          max: 100.0,
          divisions: 100,
          activeColor: WidgetStyleConstants.globalSuccessColor,
          onChanged: (_value == null)
              ? null
              : (double value) {
                  setState(() => _value = value.toInt());
                }, // Required
          onChangeEnd: (double value) {
            // Only send the update when user releases slider
            _brightnessProvider.setBrightnessLevelAction(value.round());
          },
        ),
        trailing: Text(
            '${_brightnessProvider.getBrightnessState?.round() ?? "--"}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: _iconColor)));
  }
}
