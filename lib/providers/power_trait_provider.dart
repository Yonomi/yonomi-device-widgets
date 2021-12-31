import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendPowerMethod = Future<void> Function(
    Request request, String id, bool onOff);

class PowerTraitProvider extends DeviceProvider {
  static const int MAX_RETRIES = 10;
  static const int RETRY_DELAY_MS = 750;
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
    if (!isPerformingAction) {
      setState = WidgetState.performingAction;

      try {
        await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

        int numRetries = 0;
        while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
          await getDetails(_request, _deviceId);

          await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
          numRetries++;
        }
        setState = WidgetState.idle;
      } catch (error) {
        setErrorState(error.toString());
        await Future.delayed(Duration(seconds: 1))
            .then((_) => setState = WidgetState.idle);
      }
    }
  }

  PowerTrait? getPowerTrait() {
    try {
      return deviceDetail?.traits.first as PowerTrait?;
    } catch (error) {
      return null;
    }
  }

  bool get getOnOffState {
    return getPowerTrait()?.state.value ?? false;
  }

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
