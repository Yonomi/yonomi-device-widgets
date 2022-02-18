import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class BrightnessProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'BRIGHTNESS';

  late final String _deviceId;
  late final Request _request;

  BrightnessProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    this._deviceId = deviceId;
    this._request = request;
  }

  BrightnessTrait? getBrightnessTrait() {
    return trait<BrightnessTrait>() as BrightnessTrait?;
  }

  int? getBrightness() {
    return getBrightnessTrait()?.stateWhereType<Brightness>().value;
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
