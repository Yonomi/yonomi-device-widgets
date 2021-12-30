import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
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
            create: (context) => BatteryLevelTraitProvider(request, deviceId)),
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
        return CircularProgressIndicator();
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
          Row(children: [
            SizedBox(width: 50),
            createTraitWidget(traits.first),
          ]),
          ...traits
              .skip(1)
              .map((trait) => createSlimTraitWidget(trait))
              .toList(),
        ])));
  }

  Widget createTraitWidget(Trait trait) {
    switch (trait.runtimeType) {
      case LockTrait:
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LockWidget(lockProvider),
          );
        });
      case PowerTrait:
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PowerWidget(powerProvider),
          );
        });
      case BatteryLevelTrait:
        return Consumer<BatteryLevelTraitProvider>(
            builder: (_, batteryLevelProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BatteryWidget(batteryLevelProvider),
          );
        });
      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              UnknownItemIcon(
                size: 20.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(trait.name, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        );
    }
  }

  Widget createSlimTraitWidget(Trait trait) {
    switch (trait.runtimeType) {
      case BatteryLevelTrait:
        return Consumer<BatteryLevelTraitProvider>(
            builder: (_, batteryLevelProvider, child) {
          final batteryLevel = batteryLevelProvider.getBatteryLevel;

          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  BatteryLevelIcon(
                    batteryLevelProvider.getBatteryLevel,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Battery Level: $batteryLevel%',
                        style: TextStyle(
                            fontSize: 20,
                            color: _getBatteryLevelColor(batteryLevel))),
                  ),
                ],
              ));
        });
      default:
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                UnknownItemIcon(
                  size: 20.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(trait.name,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ));
    }
  }

  Color _getBatteryLevelColor(int batteryLevel) {
    if (batteryLevel >= WidgetStyleConstants.batteryFullMin) {
      return WidgetStyleConstants.globalSuccessColor;
    } else if (batteryLevel <= WidgetStyleConstants.batteryLowMax) {
      return WidgetStyleConstants.globalWarningColor;
    } else {
      return Colors.white;
    }
  }
}
