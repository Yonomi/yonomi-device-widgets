import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/traits/device_widget_factory.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceWidgetBuilder {
  final _primaryTraitWidgets = <Widget>[];
  final _traitWidgets = <Widget>[];

  DeviceWidgetBuilder withPrimaryTrait(Trait trait,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive,
      padding = const EdgeInsets.all(8.0),
      margins = const EdgeInsets.only(bottom: 8.0)}) {
    _primaryTraitWidgets.add(_card(
        DeviceWidgetFactory.produceWidget(trait,
            iconColor: iconColor, textColor: textColor),
        padding,
        margins));

    return this;
  }

  void _withTrait(trait,
      {required backgroundColor,
      EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    _traitWidgets.add(_card(
        DeviceWidgetFactory.produceSlimWidget(trait,
            backgroundColor: backgroundColor),
        padding,
        margins));
  }

  DeviceWidgetBuilder withTraits(List<Trait> traits,
      {backgroundColor = Colors.white,
      EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    traits.forEach((trait) {
      _withTrait(trait,
          backgroundColor: backgroundColor, padding: padding, margins: margins);
    });

    return this;
  }

  Widget build() {
    return Column(
      children: [..._primaryTraitWidgets, ..._traitWidgets],
    );
  }

  Widget _card(Widget content, EdgeInsets padding, EdgeInsets margins) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        margin: margins,
        child: Padding(padding: padding, child: content));
  }
}
