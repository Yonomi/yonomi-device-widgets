import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendPowerMethod = Future<void> Function(
    Request request, String id, bool onOff);

class PowerTraitProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'POWER';

  late String _deviceId;
  late Request _request;

  PowerTraitProvider(
    Request request,
    String deviceId, {
    GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
  }) : super(request, deviceId, getDetails: getDetails) {
    this._deviceId = deviceId;
    this._request = request;
  }

  /// Run the "makePowerActionRequest" mutation on this device
  ///
  /// @param desiredOnOffState use true to set power state to on, false otherwise
  /// @throws ServerException for any errors returned by the platform
  Future<void> sendPowerOnOffAction(bool desiredOnOffState,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendPowerMethod sendPowerMethod =
          PowerRepository.sendPowerAction}) async {
    return performAction<bool>(desiredOnOffState, () => getOnOffState,
        () => sendPowerMethod(_request, this._deviceId, desiredOnOffState),
        getDetails: getDetails);
  }

  PowerTrait? getPowerTrait() {
    return deviceDetail?.traits.firstWhere((element) => element is PowerTrait,
        orElse: null) as PowerTrait?;
  }

  bool get getOnOffState {
    return getPowerTrait()?.state.value ?? false;
  }

  bool get supportsDiscreteOnOff =>
      getPowerTrait()
          ?.properties
          .whereType<SupportsDiscreteOnOff>()
          .first
          .value ??
      false;

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
