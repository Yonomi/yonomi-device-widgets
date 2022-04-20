import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';

class ColorSlimWidget extends BaseSlimWidget {
  ColorSlimWidget(ColorProvider _colorTraitProvider)
      : super(
            provider: _colorTraitProvider,
            leftIcon: UnknownItemIcon(),
            headerText: Text('Color'));
}
