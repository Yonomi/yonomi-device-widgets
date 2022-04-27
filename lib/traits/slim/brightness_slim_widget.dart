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
    final brightness = _brightnessValue();
    return ListTile(
        tileColor: _backgroundColor,
        leading: (_brightnessProvider.isPerformingAction ||
                _brightnessProvider.isLoading)
            ? SizedBox(
                child: CircularProgressIndicator(), height: 20, width: 20)
            : Icon(BootstrapIcons.sun, color: _iconColor),
        title: Slider(
          label: 'Brightness',
          value: brightness?.toDouble() ?? 50.0,
          max: 100.0,
          divisions: 100,
          activeColor: WidgetStyleConstants.globalSuccessColor,
          onChanged: (brightness == null)
              ? null
              : (double value) {
                  setState(() => _value = value.toInt());
                }, // Required
          onChangeEnd: (double value) {
            // Only send the update when user releases slider
            setState(() => _value = value.toInt());
            _brightnessProvider.setBrightnessLevelAction(value.round());
          },
        ),
        horizontalTitleGap: 16.0,
        contentPadding: EdgeInsets.all(0),
        trailing: Text('${brightness ?? "--"}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: _iconColor)));
  }

  int? _brightnessValue() {
    if (_value == null) {
      setState(() {
        _value = _brightnessProvider.getBrightnessState;
        super.reassemble();
      });
    }
    return _value;
  }
}
