import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart' as yoSdk;

class DetailScreen extends StatelessWidget {
  final Request request;
  final String deviceId;

  const DetailScreen({Key? key, required this.request, required this.deviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TraitBasedDeviceNotifier(request, deviceId),
      child: Consumer<TraitBasedDeviceNotifier>(
          builder: (_, traitBasedDeviceNotifier, child) {
        if (traitBasedDeviceNotifier.deviceDetail == null) {
          return CircularProgressIndicator();
        } else {
          return Column(
              children:
                  traitBasedDeviceNotifier.deviceDetail!.traits.map((element) {
            return Row(
              children: [Text(element.name)],
            );
          }).toList());
        }
      }),
    );
  }
}

// class isPowered extends yoSdk.State<bool> {
//   isPowered(bool isOn) : super("Power", isOn);
// }

// class PowerTrait extends Trait {
//   PowerTrait(String name, yoSdk.State state) : super(name, state);
// }

// class TraitWidgetsBuilder {
//   static Widget build(Device deviceDetail) {
//     List<Trait> dummyTraits = [
//       LockTrait("whenLocked", IsLocked(true)),
//       LockTrait("whenUnlocked", IsLocked(false)),
//       PowerTrait("PowerTrait", isPowered(true)),
//       UnknownTrait(),
//     ];

//     // TODO: L41: use deviceDetail.traits, not dummyTraits;
//     return Column(
//       children: [
//         buildDeviceTitleRow(deviceDetail.displayName),
//         ...buildTraitRows(dummyTraits),
//       ],
//     );
//   }

//   static Widget buildDeviceTitleRow(String deviceName) {
//     return Row(
//       children: [Text(deviceName)],
//     );
//   }

//   static List<Row> buildTraitRows(List<Trait> traits) {
//     List<Row> traitRows = [];
//     for (var trait in traits) {
//       traitRows.add(
//         Row(
//           children: [traitFactory(trait)],
//         ),
//       );
//     }
//     return traitRows;
//   }

//   static Widget traitFactory(Trait trait) {
//     switch (trait.runtimeType) {
//       case LockTrait:
//         return LockTraitWidget(trait);
//       case PowerTrait:
//         return PowerTraitWidget(trait);
//       default:
//         return UnknownTraitWidget(trait);
//     }
//   }
// }

// class LockTraitWidget extends StatelessWidget {
//   Trait trait;

//   LockTraitWidget(this.trait);

//   @override
//   Widget build(BuildContext context) {
//     return Text("Lock-based: ${this.trait.name}");
//   }
// }

// class PowerTraitWidget extends StatelessWidget {
//   Trait trait;

//   PowerTraitWidget(this.trait);

//   @override
//   Widget build(BuildContext context) {
//     return Text("Power Trait: ${this.trait.name}");
//     // return Switch(
//     //   value: false,
//     //   onChanged: (bool newValue) {
//     //     print("Switched ${newValue}");
//     //   },
//     // );
//   }
// }

// class UnknownTraitWidget extends StatelessWidget {
//   Trait trait;

//   UnknownTraitWidget(this.trait);

//   @override
//   Widget build(BuildContext context) {
//     return Text("Unknown Trait: ${this.trait.name}");
//   }
// }
