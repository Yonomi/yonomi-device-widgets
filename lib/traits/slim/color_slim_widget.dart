import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class ColorSlimWidget extends BaseSlimWidget {
  ColorSlimWidget(ColorProvider _colorTraitProvider,
      {Key? key,
      Color backgroundColor = Colors.white70,
      Color textColor = WidgetStyleConstants.darkTextColor})
      : super(
            key: key,
            backgroundColor: backgroundColor,
            provider: _colorTraitProvider,
            leftIcon: Icon(
              BootstrapIcons.lightbulb,
              color: WidgetStyleConstants.deviceIconColor,
            ),
            headerText:
                Text('Color', style: TextStyle(fontSize: 20, color: textColor)),
            rightIcon: Builder(builder: ((context) {
              return TextButton(
                  onPressed: () {
                    final pickedColor = _colorTraitProvider.getColorState;
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                                backgroundColor: Colors.white,
                                children: [
                                  SlidePicker(
                                    showParams: false,
                                    displayThumbColor: true,
                                    showSliderText: false,
                                    pickerColor: _hsbToColor(pickedColor),
                                    enableAlpha: false,
                                    onColorChanged: (color) {
                                      final calculatedColor =
                                          HSVColor.fromColor(color);
                                      _colorTraitProvider.setColorAction(
                                          HSBColor(
                                              calculatedColor.hue.toInt(),
                                              (calculatedColor.saturation * 100)
                                                  .toInt(),
                                              (calculatedColor.value * 100)
                                                  .toInt()));
                                    },
                                    colorModel: ColorModel.hsv,
                                  )
                                ]));
                  },
                  child: SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: _hsbToColor(
                                  _colorTraitProvider.getColorState),
                              radius: 14,
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Icon(
                              BootstrapIcons.pencil,
                              color: WidgetStyleConstants.globalSuccessColor,
                              size: 20.0,
                            )
                          ],
                        ),
                      ),
                      width: 60,
                      height: 28));
            })));

  static Color _hsbToColor(HSBColor? hsbColor) {
    if (hsbColor == null) {
      return Colors.transparent;
    } else {
      return HSVColor.fromAHSV(1.0, hsbColor.hue.toDouble(),
              hsbColor.saturation / 100.0, hsbColor.brightness / 100.0)
          .toColor();
    }
  }
}
