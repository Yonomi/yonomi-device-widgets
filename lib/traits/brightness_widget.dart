import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class BrightnessWidget extends StatelessWidget with ToastNotifications {
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
            value: _brightnessProvider.getBrightnessState?.toDouble() ?? 50.0,
            thumbColor: (_brightnessProvider.getBrightnessState == null)
                ? Colors.transparent
                : null,
            max: 100.0,
            divisions: 100,
            activeColor: WidgetStyleConstants.globalSuccessColor,
            onChanged: (double value) {}, // Required
            onChangeEnd: (double value) {
              // Only send the update when user releases slider
              _brightnessProvider.setBrightnessLevelAction(value.round());
            },
          )),
          Text(
            '${_brightnessProvider.getBrightnessState?.round() ?? "--"}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: _textColor),
          )
        ])
      ]);
    }
  }
}
