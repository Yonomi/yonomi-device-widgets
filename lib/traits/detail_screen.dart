import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
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
        ChangeNotifierProvider<TraitBasedDeviceNotifier>(
            create: (context) => TraitBasedDeviceNotifier(request, deviceId)),
        ChangeNotifierProvider(
            create: (context) => LockProvider(request, deviceId)),
      ],
      child: DetailScreenWidget(request, deviceId),
    );
  }
}

class DetailScreenWidget extends StatelessWidget {
  @required
  Request request;

  @required
  String deviceId;

  DetailScreenWidget(this.request, this.deviceId);

  @override
  Widget build(BuildContext context) {
    return Consumer<TraitBasedDeviceNotifier>(
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
        child: Column(
            children: traits.map((element) {
          return Row(children: [
            SizedBox(width: 50),
            createTraitWidget(element.name),
          ]);
        }).toList()),
      ),
    );
  }

  Widget createTraitWidget(String name) {
    switch (name) {
      case 'lock':
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LockWidget(lockProvider),
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
                child: Text(name, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        );
    }
  }
}
