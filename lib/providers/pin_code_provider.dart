import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendAddPinCodeMethod = Future<void> Function(
    Request request, String id, String pinCode, String pinCodeName);

class PinCodeProvider extends DeviceProvider {
  static const _DEFAULT_DISPLAY_NAME = 'PIN_CODE';

  late String _deviceId;
  late Request _request;

  PinCodeProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    this._deviceId = deviceId;
    this._request = request;
  }

  /// Run the "makePowerActionRequest" mutation on this device
  ///
  /// @param desiredOnOffState use true to set power state to on, false otherwise
  /// @throws ServerException for any errors returned by the platform
  Future<void> sendAddPinCode(String pinCode, String pinCodeName,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendAddPinCodeMethod sendAddPinCodeMethod =
          PinCodeRepository.sendAddPinCodeAction}) async {
    return performAction<List<PinCodeCredential>>(
        [...?getPinCodeCredentials, PinCodeCredential(pinCodeName, pinCode)],
        () => getPinCodeCredentials,
        () => sendAddPinCodeMethod(
            _request, this._deviceId, pinCode, pinCodeName),
        getDetails: getDetails);
  }

  PinCodeTrait? getPinCodeTrait() {
    return trait<PinCodeTrait>() as PinCodeTrait?;
  }

  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;

  /// State(s)
  List<PinCodeCredential>? get getPinCodeCredentials =>
      getPinCodeTrait()?.pinCodes;

  /// Properties
  int? get maxNumberOfCredentials => getPinCodeTrait()?.maxNumberOfCredentials;

  PinCodeLengthRange? get pinCodeLengthRange =>
      getPinCodeTrait()?.pinCodeLengthRange;

  PinCodeNameLengthRange? get nameLengthRange =>
      getPinCodeTrait()?.nameLengthRange;
}
