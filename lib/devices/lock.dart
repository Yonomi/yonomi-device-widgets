import 'package:device_widgets/components/lock_widget.dart';
import 'package:device_widgets/providers/lock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class Lock extends StatelessWidget {
  final Request request;
  final String deviceId;

  const Lock({Key key, @required this.request, @required this.deviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LockProvider(request, deviceId),
      child: LockWidget(),
    );
  }

}