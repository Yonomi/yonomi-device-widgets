import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as yoSdk;

class TraitBasedDetailScreen extends StatelessWidget {
  final Request request;
  final String deviceId;

  const TraitBasedDetailScreen({
    Key? key,
    required this.request,
    required this.deviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TraitBasedDeviceNotifier(request, deviceId),
      child: Consumer<TraitBasedDeviceNotifier>(
          builder: (_, traitBasedDeviceNotifier, child) {
        if (traitBasedDeviceNotifier.isLoading) {
          return CircularProgressIndicator();
        } else {
          return TraitWidgetsBuilder.build(this.request, this.deviceId,
              traitBasedDeviceNotifier.deviceDetail!);
        }
      }),
    );
  }
}

class isPowered extends yoSdk.State<bool> {
  isPowered(bool isOn) : super("Power", isOn);
}

class PowerTrait extends Trait {
  PowerTrait(String name, yoSdk.State state) : super(name, state);
}

class TraitWidgetsBuilder {
  static Widget build(Request req, String deviceId, Device deviceDetail) {
    List<Trait> dummyTraits = [
      LockTrait("whenLocked", IsLocked(true)),
      LockTrait("whenUnlocked", IsLocked(false)),
      PowerTrait("PowerTrait", isPowered(true)),
      UnknownTrait(),
    ];

    // TODO: L41: use deviceDetail.traits, not dummyTraits;
    return Column(
      children: [
        buildDeviceTitleRow(deviceDetail.displayName),
        ...buildTraitRows(req, deviceId, dummyTraits),
      ],
    );
  }

  static Widget buildDeviceTitleRow(String deviceName) {
    return Row(
      children: [Text(deviceName)],
    );
  }

  static List<Row> buildTraitRows(
      Request request, String deviceId, List<Trait> traits) {
    List<Row> traitRows = [];
    for (var trait in traits) {
      traitRows.add(
        Row(
          children: [traitFactory(request, deviceId, trait)],
        ),
      );
    }
    return traitRows;
  }

  static Widget traitFactory(Request req, String deviceId, Trait trait) {
    switch (trait.runtimeType) {
      case LockTrait:
        return LockTraitWidget(trait);
      case PowerTrait:
        return PowerTraitWidget(req, deviceId, trait);
      default:
        return UnknownTraitWidget(trait);
    }
  }
}

class LockTraitWidget extends StatelessWidget {
  final Trait trait;

  LockTraitWidget(this.trait);

  @override
  Widget build(BuildContext context) {
    return Text("Lock-based: ${this.trait.name}");
  }
}

class PowerTraitWidget extends StatelessWidget {
  final Trait trait;

  final Request request;

  final String deviceId;

  const PowerTraitWidget(this.request, this.deviceId, this.trait);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PowerTraitProvider(request, deviceId),
      child: Consumer<PowerTraitProvider>(
          builder: (_, powerDeviceNotifier, child) {
        if (powerDeviceNotifier.isLoading ||
            powerDeviceNotifier.isPerformingAction) {
          return CircularProgressIndicator();
        } else {
          return Switch(
            value: powerDeviceNotifier.getPowerTrait()?.state.value ?? false,
            onChanged: (bool newValue) {
              print("Power Switch value set to: ${newValue}");
              powerDeviceNotifier.sendPowerOnOffAction(newValue);
            },
          );
        }
      }),
    );
  }
}

class UnknownTraitWidget extends StatelessWidget {
  Trait trait;

  UnknownTraitWidget(this.trait);

  @override
  Widget build(BuildContext context) {
    return Text("Unknown Trait: ${this.trait.name}");
  }
}
