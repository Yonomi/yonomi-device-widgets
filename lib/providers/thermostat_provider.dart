import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'device_provider.dart';

typedef SetPointActionFunction = Future<void> Function(
    Request request, String id, double temperature);

typedef SetModeFunction = Future<void> Function(
    Request request, String id, GThermostatMode mode);

typedef SetFanModeFunction = Future<void> Function(
    Request request, String id, AvailableFanMode mode);

class ThermostatProvider extends DeviceProvider {
  ThermostatProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    this._request = request;
  }

  static const _DEFAULT_DISPLAY_NAME = 'THERMOSTAT';
  late Request _request;

  ThermostatTrait? getThermostatTrait() {
    return trait<ThermostatTrait>() as ThermostatTrait?;
  }

  Future<void> setPointAction(String deviceId, double temperature,
      {SetPointActionFunction setPoint =
          ThermostatRepository.setPointThermostat}) async {
    return performAction<double>(temperature, () => getTargetTemperatureState,
        () => setPoint(_request, deviceId, temperature));
  }

  Future<void> setThermostatMode(String deviceId, AvailableThermostatMode mode,
      {SetModeFunction setMode = ThermostatRepository.setMode}) async {
    return performAction(
        mode, () => getModeState, () => setMode(_request, deviceId, mode));
  }

  Future<void> setFanMode(String deviceId, AvailableFanMode fanMode,
      {SetFanModeFunction setFanMode = ThermostatRepository.setFanMode}) async {
    return performAction(fanMode, () => getFanModeState,
        () => setFanMode(_request, deviceId, fanMode));
  }

  AvailableThermostatMode get getModeState {
    return getThermostatTrait()?.stateWhereType<ThermostatMode>().value ??
        AvailableThermostatMode.OFF;
  }

  double? get getTargetTemperatureState =>
      getThermostatTrait()?.stateWhereType<TargetTemperature>().value;

  double? get getAmbientTemperatureState =>
      getThermostatTrait()?.stateWhereType<AmbientTemperature>().value;

  AvailableFanMode get getFanModeState {
    return getThermostatTrait()?.stateWhereType<FanMode>().value;
  }

  Set<AvailableFanMode> get getAvailableFanModes {
    return getThermostatTrait()?.availableFanModes ?? {};
  }

  Set<AvailableThermostatMode> get getAvailableThermostatModes {
    return getThermostatTrait()?.availableThermostatModes ?? {};
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
