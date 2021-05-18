import 'package:yonomi_device_widgets/components/thermostat_widget.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/request/request.dart';
import 'package:provider/provider.dart';

class Thermostat extends StatelessWidget {
  final Request request;
  final String deviceId;

  const Thermostat({Key key, @required this.request, @required this.deviceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThermostatProvider(request, deviceId),
      child: ThermostatWidget(),
    );
  }
}
