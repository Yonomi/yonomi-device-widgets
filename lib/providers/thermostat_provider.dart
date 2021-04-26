import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/graphql/devices/thermostat/thermostat_queries.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/repository/devices/thermostat_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class ThermostatProvider extends ChangeNotifier {
  ThermostatProvider(Future<Request> request, String deviceId) {
    request.then((result) {
      _request = result;
      getDeviceDetail(deviceId);
    });
  }

  Request _request;
  Device _deviceDetail;

  Future<void> setPointAction(String deviceId, double temperature) async {
    final request = _request;
    ThermostatRepository.setPointThermostat(request, deviceId, temperature);
  }

  Future<void> setThermostatMode(String deviceId, ThermostatMode mode) async {
    final request = _request;
    ThermostatRepository.setMode(request, deviceId, mode);
  }

  Future<void> getDeviceDetail(String deviceId) async {
    final request = _request;
    _deviceDetail =
        await DevicesRepository.getThermostatDetails(request, deviceId);
    notifyListeners();
  }

  Device get deviceDetail => _deviceDetail;

  double get thermostatTargetTemperature =>
      _deviceDetail?.traits?.first?.state?.value ?? 0;
}
