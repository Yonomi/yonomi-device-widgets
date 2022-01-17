import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/device_widget_factory.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceWidgetBuilder {
  final primaryTraitWidgets = <Widget>[];
  final traitWidgets = <Widget>[];

  DeviceWidgetBuilder withPrimaryTrait(Trait trait,
      {padding = const EdgeInsets.all(8.0),
      margins = const EdgeInsets.only(bottom: 8.0)}) {
    primaryTraitWidgets.add(_card(_createTraitWidget(trait), padding, margins));

    return this;
  }

  DeviceWidgetBuilder withTrait(trait,
      {EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    traitWidgets.add(_card(_createTraitListWidget(trait), padding, margins));

    return this;
  }

  DeviceWidgetBuilder withTraits(List<Trait> traits,
      {EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    traits.forEach((trait) {
      withTrait(trait, padding: padding, margins: margins);
    });

    return this;
  }

  Widget build() {
    return Column(
      children: [...primaryTraitWidgets, ...traitWidgets],
    );
  }

  Widget _card(Widget content, EdgeInsets padding, EdgeInsets margins) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        margin: margins,
        child: Padding(padding: padding, child: content));
  }

  Widget _createTraitWidget(Trait trait,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
    switch (trait.runtimeType) {
      case LockTrait:
        return DeviceWidgetFactory.produceWidget<LockProvider>(
            iconColor: iconColor, textColor: textColor);
      case PowerTrait:
        return DeviceWidgetFactory.produceWidget<PowerTraitProvider>(
            iconColor: iconColor, textColor: textColor);
      case BatteryLevelTrait:
        return DeviceWidgetFactory.produceWidget<BatteryLevelProvider>(
            iconColor: iconColor, textColor: textColor);
      default:
        return DeviceWidgetFactory.produceWidget(iconColor: iconColor);
    }
  }

  Widget _createTraitListWidget(Trait trait, {backgroundColor = Colors.white}) {
    switch (trait.runtimeType) {
      case LockTrait:
        return DeviceWidgetFactory.produceSlimWidget<LockProvider>(
            backgroundColor: backgroundColor);
      case PowerTrait:
        return DeviceWidgetFactory.produceSlimWidget<PowerTraitProvider>(
            backgroundColor: backgroundColor);
      case BatteryLevelTrait:
        return DeviceWidgetFactory.produceSlimWidget<BatteryLevelProvider>(
            backgroundColor: backgroundColor);
      default:
        return DeviceWidgetFactory.produceSlimWidget(
            name: trait.name, backgroundColor: backgroundColor);
    }
  }
}
