import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/graphql/devices/thermostat/thermostat_queries.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/repository/devices/thermostat_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class ThermostatProvider extends ChangeNotifier {
  ThermostatProvider(Request request, String deviceId) {
    _request = request;
    getDeviceDetail(deviceId);
  }

  Request _request;
  Device _deviceDetail;

  ThermostatTrait getThermostatTrait() {
    return _deviceDetail?.traits?.first;
  }

  Future<void> setPointAction(String deviceId, double temperature) async {
    ThermostatRepository.setPointThermostat(_request, deviceId, temperature);
  }

  Future<void> setThermostatMode(String deviceId, ThermostatMode mode) async {
    ThermostatRepository.setMode(_request, deviceId, mode);
  }

  Future<void> getDeviceDetail(String deviceId) async {
    _deviceDetail =
        await DevicesRepository.getThermostatDetails(_request, deviceId);
    notifyListeners();
  }

  Device get deviceDetail => _deviceDetail;

  double get thermostatTargetTemperature =>
      getThermostatTrait()?.state?.value ?? 0;
}
