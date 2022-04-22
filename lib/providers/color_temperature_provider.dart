import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SetColorTemperatureFunction = Future<void> Function(
    Request request, String id, int colorTemperature);

class ColorTemperatureProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'COLOR TEMPERATURE';

  late final String _deviceId;
  late final Request _request;

  ColorTemperatureProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    this._deviceId = deviceId;
    this._request = request;
  }

  ColorTemperatureTrait? getColorTemperatureTrait() {
    return trait<ColorTemperatureTrait>() as ColorTemperatureTrait?;
  }

  int? get getColorTemperatureState =>
      getColorTemperatureTrait()?.stateWhereType<ColorTemperature>().value
          as int?;

  int? get getMinColorTemperature => getColorTemperatureTrait()
      ?.propertyWhereType<SupportedColorTemperatureRange>()
      .value
      .min as int?;

  int? get getMaxColorTemperature => getColorTemperatureTrait()
      ?.propertyWhereType<SupportedColorTemperatureRange>()
      .value
      .max as int?;

  Future<void> setColorTemperatureAction(int colorTemperature,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SetColorTemperatureFunction setColorTemperatureFunction =
          ColorTemperatureRepository.setColorTemperatureAction}) {
    return performAction<int>(
      colorTemperature,
      () => getColorTemperatureState,
      () => setColorTemperatureFunction(_request, _deviceId, colorTemperature),
      getDetails: getDetails,
    );
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
