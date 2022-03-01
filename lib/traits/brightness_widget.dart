import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BrightnessWidget extends StatefulWidget {
  final BrightnessProvider _brightnessProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  BrightnessWidget(this._brightnessProvider,
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
  State<StatefulWidget> createState() => _BrightnessWidgetState(
      _brightnessProvider, _iconColor, _textColor, _iconSize);
}

class _BrightnessWidgetState extends State<BrightnessWidget>
    with ToastNotifications {
  final BrightnessProvider _brightnessProvider;
  final Color _iconColor;
  final double _iconSize;
  final Color _textColor;
  int? _value;

  _BrightnessWidgetState(this._brightnessProvider, this._iconColor,
      this._textColor, this._iconSize) {
    _value = _brightnessProvider.getBrightnessState;
  }

  @override
  Widget build(BuildContext context) {
    if (_brightnessProvider.isLoading) {
      return CircularProgressIndicator();
    } else if (_brightnessProvider.isInErrorState) {
      showToast(context, _brightnessProvider.getErrorMessage);
      return Icon(
        Icons.error,
        color: WidgetStyleConstants.globalWarningColor,
      );
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
        Row(
          children: <Widget>[
            Text(
              'BRIGHTNESS',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: _textColor),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          child: Center(
              child: SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: _brightnessProvider.isPerformingAction
                ? CircularProgressIndicator()
                : Icon(BootstrapIcons.sun, color: _iconColor, size: _iconSize),
          )),
        ),
        SizedBox(height: 10),
        Row(children: [
          Icon(
            BootstrapIcons.sun,
            color: _iconColor,
          ),
          Expanded(
              child: Slider(
            label: 'Brightness',
                value: _brightnessValue()?.toDouble() ?? 50.0,
            max: 100.0,
            divisions: 100,
            activeColor: WidgetStyleConstants.globalSuccessColor,
            // When onChanged is null it makes the slider disabled
                onChanged: (_brightnessValue() == null)
                ? null
                : (double value) {
                    setState(() => _value = value.toInt());
                  }, // Required
            onChangeEnd: (double value) {
              // Only send the update when user releases slider
                  setState(() => _value = value.toInt());
              _brightnessProvider.setBrightnessLevelAction(value.round());
            },
          )),
          Text(
                '${_brightnessValue() ?? "--"}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: _textColor),
          )
        ])
      ]);
    }
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
