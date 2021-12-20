import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class BatteryLevelTraitProvider extends ChangeNotifier {
  Device? _deviceDetail;

  late String _deviceId;

  late Request _request;

  WidgetState _state = WidgetState.idle;

  BatteryLevelTraitProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails =
          DevicesRepository.getDeviceDetails}) {
    this._deviceId = deviceId;
    this._request = request;
    fetchData(getDeviceDetails: getDetails);
  }

  Device? get deviceDetail => _deviceDetail;

  Future<Device?> fetchData(
      {GetDeviceDetailsMethod getDeviceDetails =
          DevicesRepository.getDeviceDetails}) async {
    _state = WidgetState.loading;

    try {
      _deviceDetail = await getDeviceDetails(_request, _deviceId);
    } catch (error) {
      _state = WidgetState.error;
      return null;
    }

    _state = WidgetState.idle;
    return deviceDetail;
  }

  BatteryLevelTrait? getBatteryLevelTrait() {
    return deviceDetail?.traits
            .firstWhere((trait) => trait.runtimeType is BatteryLevelTrait)
        as BatteryLevelTrait;
  }

  int get getBatteryLevel {
    return getBatteryLevelTrait()?.state.value ?? 0;
  }

  bool get isLoading => _state == WidgetState.loading;

  bool get isInErrorState => _state == WidgetState.error;
}
