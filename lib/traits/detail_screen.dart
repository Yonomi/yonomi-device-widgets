import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/device_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DetailScreen extends StatelessWidget {
  final Request request;
  final String deviceId;

  const DetailScreen({Key? key, required this.request, required this.deviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TraitDetailProvider>(
            create: (context) => TraitDetailProvider(request, deviceId)),
        ChangeNotifierProvider(
            create: (context) => LockProvider(request, deviceId)),
        ChangeNotifierProvider(
            create: (context) => PowerTraitProvider(request, deviceId)),
        ChangeNotifierProvider(
            create: (context) => BatteryLevelProvider(request, deviceId)),
      ],
      child: DetailScreenWidget(request, deviceId),
    );
  }
}

class DetailScreenWidget extends StatelessWidget {
  @required
  final Request request;

  @required
  final String deviceId;

  DetailScreenWidget(this.request, this.deviceId);

  @override
  Widget build(BuildContext context) {
    return Consumer<TraitDetailProvider>(
        builder: (_, traitBasedDeviceNotifier, child) {
      if (traitBasedDeviceNotifier.isLoading) {
        return Center(child: CircularProgressIndicator());
      } else {
        return buildContainer(traitBasedDeviceNotifier.deviceDetail!.traits);
      }
    });
  }

  Widget buildContainer(List<Trait> traits) {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: Column(children: [
          _card(_createTraitWidget(traits.first), const EdgeInsets.all(8.0),
              const EdgeInsets.only(bottom: 8.0)),
          ...traits.skip(1).map((trait) {
            return _card(
                _createTraitListWidget(trait),
                const EdgeInsets.all(8.0),
                const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0));
          }).toList()
        ])));
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
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return LockWidget(lockProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case PowerTrait:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return PowerWidget(powerProvider,
              iconColor: iconColor, textColor: textColor);
        });
      case BatteryLevelTrait:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, child) {
          return BatteryWidget(batteryLevelProvider,
              iconColor: iconColor, textColor: textColor);
        });
      default:
        return UnknownItemIcon(color: iconColor);
    }
  }

  Widget _createTraitListWidget(Trait trait, {backgroundColor = Colors.white}) {
    switch (trait.runtimeType) {
      case LockTrait:
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return LockSlimWidget(lockProvider, backgroundColor: backgroundColor);
        });
      case PowerTrait:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return PowerSlimWidget(powerProvider,
              backgroundColor: backgroundColor);
        });
      case BatteryLevelTrait:
        return Consumer<BatteryLevelProvider>(
            builder: (_, batteryLevelProvider, child) {
          return BatterySlimWidget(batteryLevelProvider,
              backgroundColor: backgroundColor);
        });
      default:
        return DeviceSlimWidget(
          backgroundColor: backgroundColor,
          leftIcon: UnknownItemIcon(
            size: 20.0,
            color: WidgetStyleConstants.deviceDetailIconColorActive,
          ),
          headerText: Text(trait.name,
              style: TextStyle(
                  fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
        );
    }
  }
}
