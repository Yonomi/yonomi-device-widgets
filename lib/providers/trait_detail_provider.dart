import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef GetDetailsFunction = Future<Device> Function(
    Request request, String id);

class TraitDetailProvider extends DeviceProvider {
  TraitDetailProvider(Request request, String deviceId,
      {GetDetailsFunction getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId) {
    fetchData(getDetails: getDetails);
  }

  @override
  String get displayName => deviceDetail?.displayName ?? 'TRAIT';
}
