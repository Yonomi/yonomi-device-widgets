import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class ColorSlimWidget extends BaseSlimWidget {
  ColorSlimWidget(ColorProvider _colorTraitProvider)
      : super(
            provider: _colorTraitProvider,
            leftIcon: UnknownItemIcon(),
            headerText: Text('Color'),
            rightIcon: TextButton(
                onPressed: () {
                  final pickedColor = _colorTraitProvider.getColorState;
                  SlidePicker(
                    pickerColor: _hsbToColor(pickedColor),
                    onColorChanged: (color) {
                      final calculatedColor = HSVColor.fromColor(color);
                      _colorTraitProvider.setColorAction(HSBColor(
                          calculatedColor.hue.toInt(),
                          (calculatedColor.saturation * 100).toInt(),
                          (calculatedColor.value * 100).toInt()));
                    },
                    colorModel: ColorModel.hsv,
                  );
                },
                child: SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                _hsbToColor(_colorTraitProvider.getColorState),
                            radius: 14,
                          ),
                          Icon(
                            BootstrapIcons.pencil,
                            color: WidgetStyleConstants.globalSuccessColor,
                            size: 14.0,
                          )
                        ],
                      ),
                    ),
                    width: 28,
                    height: 28)));

  static Color _hsbToColor(GHSBColorValueInput? hsbColor) {
    if (hsbColor == null) {
      return Colors.transparent;
    } else {
      return HSVColor.fromAHSV(1.0, hsbColor.h.toDouble(), hsbColor.s / 100.0,
              hsbColor.b / 100.0)
          .toColor();
    }
  }
}
