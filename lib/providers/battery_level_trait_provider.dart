import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class BatteryLevelTraitProvider extends ChangeNotifier {
  Device? _deviceDetail;

  late String _deviceId;

  late Request _request;

  WidgetState _state = WidgetState.idle;

  String _latestErrorMsg = "An error occurred.";

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
    _setState = WidgetState.loading;

    try {
      _deviceDetail = await getDeviceDetails(_request, _deviceId);
      _setState = WidgetState.idle;
    } catch (error) {
      _setErrorState(error.toString());
      return null;
    }

    return deviceDetail;
  }

  set _setState(WidgetState newState) {
    _state = newState;
    notifyListeners();
  }

  void _setErrorState(String errorMsg) {
    _setErrorMessage = errorMsg;
    _setState = WidgetState.error;
  }

  set _setErrorMessage(String errorMsg) {
    if (errorMsg.isEmpty) errorMsg = "An error occurred.";
    _latestErrorMsg = errorMsg;
  }

  BatteryLevelTrait? getBatteryLevelTrait() {
    try {
      return _deviceDetail?.traits.first as BatteryLevelTrait?;
    } catch (error) {
      return null;
    }
  }

  int get getBatteryLevel {
    return getBatteryLevelTrait()?.state.value ?? 0;
  }

  bool get isLoading => _state == WidgetState.loading;

  bool get isInErrorState => _state == WidgetState.error;
}
