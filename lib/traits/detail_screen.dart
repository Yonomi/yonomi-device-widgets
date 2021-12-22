import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/power_item_icon.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

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
          createTraitWidget(traits.first.name, iconColor: Colors.white),
          Accordion(
              maxOpenSections: 1,
              headerPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              children: traits.skip(1).map((trait) {
                return AccordionSection(
                  header: createTraitWidgetHeader(trait.name),
                  content: createTraitWidget(trait.name),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  contentBorderColor: Colors.white,
                  headerBackgroundColor: Colors.white,
                  contentBackgroundColor: Colors.white,
                );
              }).toList())
        ])));
  }

  Widget createTraitWidget(String name,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.deviceDetailIconColorActive}) {
    switch (name) {
      case 'lock':
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LockWidget(lockProvider,
                iconColor: iconColor, textColor: textColor),
          );
        });
      case 'power':
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PowerWidget(powerProvider,
                iconColor: iconColor, textColor: textColor),
          );
        });
      case 'battery_level':
        return Consumer<BatteryLevelTraitProvider>(
            builder: (_, batteryLevelTraitProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BatteryWidget(batteryLevelTraitProvider,
                iconColor: iconColor, textColor: textColor),
          );
        });
      default:
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UnknownItemIcon(color: iconColor));
    }
  }

  Widget createTraitWidgetHeader(String name) {
    switch (name) {
      case 'lock':
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  LockIcon(
                    lockProvider.isLocked,
                    size: 20.0,
                    color: WidgetStyleConstants.deviceDetailIconColorActive,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lockProvider.getLockTrait().name,
                          style: TextStyle(
                              fontSize: 20,
                              color: WidgetStyleConstants.darkTextColor))),
                ],
              ));
        });
      case 'power':
        return Consumer<PowerTraitProvider>(builder: (_, powerProvider, child) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  PowerItemIcon(powerProvider.getOnOffState,
                      size: 20.0,
                      color: WidgetStyleConstants.deviceDetailIconColorActive),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          (powerProvider.getPowerTrait()?.name ??
                              'Power Switch'),
                          style: TextStyle(
                              fontSize: 20,
                              color: WidgetStyleConstants.darkTextColor))),
                ],
              ));
        });
      case 'battery_level':
        return Consumer<BatteryLevelTraitProvider>(
            builder: (_, batteryLevelTraitProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                BatteryLevelIcon(
                  batteryLevelTraitProvider.getBatteryLevel,
                  size: 20.0,
                  color: WidgetStyleConstants.deviceDetailIconColorActive,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Battery Level: ${batteryLevelTraitProvider.getBatteryLevel}%',
                      style: TextStyle(
                          fontSize: 20,
                          color: _getBatteryLevelColor(
                              batteryLevelTraitProvider.getBatteryLevel))),
                ),
              ],
            ),
          );
        });
      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              UnknownItemIcon(
                size: 20.0,
                color: WidgetStyleConstants.deviceDetailIconColorActive,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name,
                    style: TextStyle(
                        fontSize: 20,
                        color: WidgetStyleConstants.darkTextColor)),
              ),
            ],
          ),
        );
    }
  }

  static Color _getBatteryLevelColor(int batteryLevel) {
    if (batteryLevel >= WidgetStyleConstants.batteryFullMin) {
      return WidgetStyleConstants.globalSuccessColor;
    } else if (batteryLevel <= WidgetStyleConstants.batteryLowMax) {
      return WidgetStyleConstants.globalWarningColor;
    } else {
      return WidgetStyleConstants.darkTextColor;
    }
  }
}
