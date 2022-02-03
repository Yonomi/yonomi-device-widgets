import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class BatteryLevelProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'BATTERY';

  BatteryLevelProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails);

  BatteryLevelTrait? getBatteryLevelTrait() {
    return trait<BatteryLevelTrait>() as BatteryLevelTrait?;
  }

  int get getBatteryLevelState {
    return state<BatteryLevelTrait, BatteryLevel>()?.value ?? 0;
  }

  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
