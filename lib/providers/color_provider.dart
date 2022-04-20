import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/src/request/request.dart';

class ColorProvider extends DeviceProvider {
  ColorProvider(Request request, String deviceId) : super(request, deviceId);

  @override
  String get displayName => 'COLOR';
}
