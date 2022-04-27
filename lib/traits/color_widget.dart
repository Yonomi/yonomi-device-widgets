import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class ColorWidget extends StatelessWidget {
  final ColorProvider _colorProvider;
  final Color textColor;
  final Color _iconColor = WidgetStyleConstants.deviceDetailIconColorActive;

  ColorWidget(this._colorProvider,
      {Key? key, this.textColor = WidgetStyleConstants.darkTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _colorProvider.isBusy
        ? Center(child: CircularProgressIndicator())
        : Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'COLOR',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: textColor),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
                child: SizedBox(width: 100, height: 100, child: _mainIcon())),
            SizedBox(height: 10),
            _stateRow(context),
          ]);
  }

  Widget _mainIcon() {
    if (_colorProvider.isInErrorState) {
      return Icon(
        Icons.error,
        size: 100.0,
        color: _iconColor,
      );
    } else if (_colorProvider.isPerformingAction) {
      return CircularProgressIndicator();
    } else {
      return Icon(
        BootstrapIcons.lightbulb,
        size: 100,
        color: _iconColor,
      );
    }
  }

  Widget _stateRow(BuildContext context) {
    final state = _colorProvider.getColorState;
    if (state == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      final pickedColor = HSVColor.fromAHSV(
          1.0, state.hue.toDouble(),
          state.saturation / 100.0, state.brightness / 100.0);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: pickedColor.toColor(),
            radius: 16,
          ),
          Padding(padding: EdgeInsets.all(4)),
          Text(
            'HSB(${state.hue}, ${state.saturation}, ${state.brightness})',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: textColor),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        SimpleDialog(backgroundColor: Colors.white, children: [
                          SlidePicker(
                            showParams: false,
                            showSliderText: false,
                            pickerColor: pickedColor.toColor(),
                            enableAlpha: false,
                            onColorChanged: (color) {
                              final calculatedColor = HSVColor.fromColor(color);
                              _colorProvider.setColorAction(HSBColor(
                                  calculatedColor.hue.toInt(),
                                  (calculatedColor.saturation * 100).toInt(),
                                  (calculatedColor.value * 100).toInt()));
                            },
                            colorModel: ColorModel.hsv,
                          )
                        ]));
              },
              icon: Icon(
                BootstrapIcons.pencil,
                color: WidgetStyleConstants.globalSuccessColor,
              ))
        ],
      );
    }
  }
}
