import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/components/lock_widget.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class Lock extends StatelessWidget {
  final Request request;
  final String deviceId;

  const Lock({Key key, @required this.request, @required this.deviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        LockProvider lockProvider = LockProvider(request, deviceId);
        lockProvider.deviceRepo = DevicesRepositoryWrapper();
        lockProvider.lockRepo = LockRepositoryWrapper();
        return lockProvider;
      },
      child: LockWidget(),
    );
  }
}
