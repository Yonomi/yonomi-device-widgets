import 'package:flutter/material.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SetPointActionFunction = Future<void> Function(
    Request request, String id, double temperature);

typedef SetModeFunction = Future<void> Function(
    Request request, String id, GThermostatMode mode);

typedef GetThermostatDetailsFunction = Future<Device> Function(
  Request request,
  String id,
);

class ThermostatProvider extends ChangeNotifier {
  ThermostatProvider(Request request, String deviceId,
      {GetThermostatDetailsFunction? injectGetThermostatDetailsMethod}) {
    this._request = request;
    getDeviceDetail(deviceId,
        injectGetThermostatDetailsMethod: injectGetThermostatDetailsMethod);
  }

  late Request _request;
  Device? _deviceDetail;

  ThermostatTrait? getThermostatTrait() {
    return _deviceDetail?.traits.first as ThermostatTrait?;
  }

  Future<void> setPointAction(String deviceId, double temperature,
      {SetPointActionFunction? injectSetPointThermostatMethod}) async {
    final setPointThermostatMethod = injectSetPointThermostatMethod ??
        ThermostatRepository.setPointThermostat;
    setPointThermostatMethod(_request, deviceId, temperature);
  }

  Future<void> setThermostatMode(String? deviceId, GThermostatMode mode,
      {SetModeFunction? injectSetModeMethod}) async {
    final setModeMethod = injectSetModeMethod ?? ThermostatRepository.setMode;
    setModeMethod(_request, deviceId!, mode);
  }

  Future<void> getDeviceDetail(String deviceId,
      {GetThermostatDetailsFunction? injectGetThermostatDetailsMethod}) async {
    final getThermostatDetailsMethod = injectGetThermostatDetailsMethod ??
        DevicesRepository.getThermostatDetails;
    _deviceDetail = await getThermostatDetailsMethod(_request, deviceId);
    notifyListeners();
  }

  Device? get deviceDetail => _deviceDetail;

  double get thermostatTargetTemperature =>
      getThermostatTrait()?.state.value ?? 0;
}
