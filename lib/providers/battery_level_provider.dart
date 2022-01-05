import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class BatteryLevelProvider extends ChangeNotifier {
  Device? _deviceDetail;

  late String _deviceId;

  late Request _request;

  WidgetState _state = WidgetState.idle;

  String _latestErrorMsg = "An error occurred.";

  BatteryLevelProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails =
          DevicesRepository.getDeviceDetails}) {
    this._deviceId = deviceId;
    this._request = request;
    fetchData(getDeviceDetails: getDetails);
  }

  Device? get deviceDetail => _deviceDetail;

  Future<void> fetchData(
      {GetDeviceDetailsMethod getDeviceDetails =
          DevicesRepository.getDeviceDetails}) async {
    _setState = WidgetState.loading;

    try {
      _deviceDetail = await getDeviceDetails(_request, _deviceId);
      _setState = WidgetState.idle;
    } catch (error) {
      _setErrorState(error.toString());
    }
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
      return _deviceDetail?.traits
              .firstWhere((trait) => trait.runtimeType == BatteryLevelTrait)
          as BatteryLevelTrait?;
    } catch (error) {
      _setErrorState(error.toString());
    }
  }

  int get getBatteryLevel {
    return getBatteryLevelTrait()?.state.value ?? 0;
  }

  String get displayName => _deviceDetail?.displayName ?? 'BATTERY';

  bool get isLoading => _state == WidgetState.loading;

  bool get isInErrorState => _state == WidgetState.error;

  String get getErrorMessage => _latestErrorMsg;
}
