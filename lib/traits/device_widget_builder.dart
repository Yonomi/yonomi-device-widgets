import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/traits/device_widget_factory.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DeviceWidgetBuilder {
  final _primaryTraitWidgets = <Widget>[];
  final _traitWidgets = <Widget>[];

  DeviceWidgetBuilder withPrimaryTrait(Trait trait,
      {padding = const EdgeInsets.all(8.0),
      margins = const EdgeInsets.only(bottom: 8.0)}) {
    _primaryTraitWidgets
        .add(_card(_createTraitWidget(trait), padding, margins));

    return this;
  }

  void _withTrait(trait,
      {EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    _traitWidgets.add(_card(_createTraitListWidget(trait), padding, margins));
  }

  DeviceWidgetBuilder withTraits(List<Trait> traits,
      {EdgeInsets padding = const EdgeInsets.all(8.0),
      EdgeInsets margins =
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0)}) {
    traits.forEach((trait) {
      _withTrait(trait, padding: padding, margins: margins);
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

  Widget _createTraitWidget(Trait trait,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
    switch (trait.runtimeType) {
      case LockTrait:
        return DeviceWidgetFactory.produceWidget<LockTrait>(
            iconColor: iconColor, textColor: textColor);
      case PowerTrait:
        return DeviceWidgetFactory.produceWidget<PowerTrait>(
            iconColor: iconColor, textColor: textColor);
      case BatteryLevelTrait:
        return DeviceWidgetFactory.produceWidget<BatteryLevelTrait>(
            iconColor: iconColor, textColor: textColor);
      case ThermostatTrait:
        return DeviceWidgetFactory.produceWidget<ThermostatTrait>(
            iconColor: iconColor, textColor: textColor);
      case BrightnessTrait:
        return DeviceWidgetFactory.produceWidget<BrightnessTrait>(
            iconColor: iconColor, textColor: textColor);
      default:
        return DeviceWidgetFactory.produceWidget<UnknownTrait>(
            iconColor: iconColor);
    }
  }

  Widget _createTraitListWidget(Trait trait, {backgroundColor = Colors.white}) {
    switch (trait.runtimeType) {
      case LockTrait:
        return DeviceWidgetFactory.produceSlimWidget<LockTrait>(
            backgroundColor: backgroundColor);
      case PowerTrait:
        return DeviceWidgetFactory.produceSlimWidget<PowerTrait>(
            backgroundColor: backgroundColor);
      case BatteryLevelTrait:
        return DeviceWidgetFactory.produceSlimWidget<BatteryLevelTrait>(
            backgroundColor: backgroundColor);
      case ThermostatTrait:
        return DeviceWidgetFactory.produceSlimWidget<ThermostatTrait>(
            backgroundColor: backgroundColor);
      case BrightnessTrait:
        return DeviceWidgetFactory.produceSlimWidget<BrightnessTrait>(
            backgroundColor: backgroundColor);
      default:
        return DeviceWidgetFactory.produceSlimWidget<UnknownTrait>(
            name: trait.name, backgroundColor: backgroundColor);
    }
  }
}
