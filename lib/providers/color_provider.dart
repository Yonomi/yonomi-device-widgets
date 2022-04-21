import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendSetColorActionFunction = Future<void> Function(
    Request request, String id, HSBColor hsbColor);

class ColorProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'COLOR';
  late final String _deviceId;
  late final Request _request;

  final GetDeviceDetailsMethod getDetails;
  final SendSetColorActionFunction sendSetColorAction;

  ColorProvider(
    Request request,
    String deviceId, {
    this.getDetails = DevicesRepository.getDeviceDetails,
    this.sendSetColorAction = ColorRepository.sendSetColorAction,
  }) : super(request, deviceId, getDetails: getDetails) {
    this._deviceId = deviceId;
    this._request = request;
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;

  ColorTrait? get getColorTrait {
    final color = trait<ColorTrait>();
    if (color is ColorTrait) {
      return color;
    } else {
      return null;
    }
  }

  GHSBColorValueInput? get getColorState {
    return getColorTrait?.stateWhereType<HSBColor>()?.value;
  }


  Future<void> setColorAction(HSBColor color) {
    return performAction<HSBColor>(color, () => getColorState,
        () => sendSetColorAction(_request, _deviceId, color),
        getDetails: getDetails);
  }
}
