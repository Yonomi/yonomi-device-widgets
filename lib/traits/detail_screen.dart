import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/device_widget_builder.dart';
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
        // coverage:ignore-start
        ChangeNotifierProvider<TraitDetailProvider>(
            create: (context) => TraitDetailProvider(request, deviceId)),
        ChangeNotifierProvider<LockProvider>(
            create: (context) => LockProvider(request, deviceId)),
        ChangeNotifierProvider<PowerTraitProvider>(
            create: (context) => PowerTraitProvider(request, deviceId)),
        ChangeNotifierProvider<BatteryLevelProvider>(
            create: (context) => BatteryLevelProvider(request, deviceId)),
        ChangeNotifierProvider<ThermostatProvider>(
            create: (context) => ThermostatProvider(request, deviceId)),
        ChangeNotifierProvider<BrightnessProvider>(
            create: (context) => BrightnessProvider(request, deviceId)),
        ChangeNotifierProvider<ColorProvider>(
            create: (context) => ColorProvider(request, deviceId)),
        ChangeNotifierProvider<ColorTemperatureProvider>(
            create: (context) => ColorTemperatureProvider(request, deviceId)),
        ChangeNotifierProvider<PinCodeProvider>(
            create: (context) => PinCodeProvider(request, deviceId)),
        // coverage:ignore-end
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
    final displayTraits = (traits.isEmpty) ? [UnknownTrait('UNKNOWN')] : traits;
    final deviceWidget = DeviceWidgetBuilder()
        .withPrimaryTrait(displayTraits.first)
        .withTraits(displayTraits.skip(1).toList())
        .build();

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Center(child: deviceWidget),
      ),
    );
  }
}
