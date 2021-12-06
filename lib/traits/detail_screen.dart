import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class DetailScreen extends StatelessWidget {
  final Request request;
  final String deviceId;

  const DetailScreen({Key? key, required this.request, required this.deviceId})
      : super(key: key);

  Widget createWidget(String name) {
    switch (name) {
      case 'lock':
        return Consumer<LockProvider>(builder: (_, lockProvider, child) {
          return LockWidget();
        });
      default:
        return Text(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TraitBasedDeviceNotifier>(
          create: (context) => TraitBasedDeviceNotifier(request, deviceId),
        ),
        ChangeNotifierProvider(
            create: (context) => LockProvider(request, deviceId)),
      ],
      child: Consumer<TraitBasedDeviceNotifier>(
          builder: (_, traitBasedDeviceNotifier, child) {
        if (traitBasedDeviceNotifier.deviceDetail == null) {
          return CircularProgressIndicator();
        } else {
          return Column(
              children:
                  traitBasedDeviceNotifier.deviceDetail!.traits.map((element) {
            return Row(
              children: [createWidget(element.name)],
            );
          }).toList());
        }
      }),
    );
  }
}
