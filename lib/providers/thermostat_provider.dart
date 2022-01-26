import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'device_provider.dart';

typedef SetPointActionFunction = Future<void> Function(
    Request request, String id, double temperature);

typedef SetModeFunction = Future<void> Function(
    Request request, String id, GThermostatMode mode);

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
    return performAction<double>(temperature, () => targetTemperature,
        () => setPoint(_request, deviceId, temperature));
  }

  Future<void> setThermostatMode(String deviceId, GThermostatMode mode,
      {SetModeFunction setMode = ThermostatRepository.setMode}) async {
    return performAction<GThermostatMode?>(
        mode,
        () => getThermostatTrait()?.states.first.value,
        () => setMode(_request, deviceId, mode));
  }

  double get targetTemperature =>
      state<ThermostatTrait, TargetTemperature>()?.value ??
      0.0;

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
