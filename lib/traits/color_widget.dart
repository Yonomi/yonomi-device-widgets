import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
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
            SizedBox(height: 10),
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
      return Container();
    } else {
      final pickedColor = HSVColor.fromAHSV(
          1.0, state.h.toDouble(), state.s / 100.0, state.b / 100.0);
      return Row(
        children: <Widget>[
          Center(
              child: CircleAvatar(
            backgroundColor: pickedColor.toColor(),
            radius: 46,
          )),
          Text(
            'HSB(${state.h}, ${state.s}, ${state.b})',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: textColor),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SlidePicker(
                          pickerColor: pickedColor.toColor(),
                          onColorChanged: (color) {
                            final calculatedColor = HSVColor.fromColor(color);
                            _colorProvider.setColorAction(HSBColor(
                                calculatedColor.hue.toInt(),
                                (calculatedColor.saturation * 100).toInt(),
                                (calculatedColor.value * 100).toInt()));
                          },
                          colorModel: ColorModel.hsv,
                        ));
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
