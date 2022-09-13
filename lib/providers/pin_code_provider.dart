import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendCreatePinCodeMethod = Future<void> Function(
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

  /// Run the "makeAddPinCodeActionRequest" mutation on this device
  ///
  /// @param pinCode the pin code
  /// @param pinCodeName the name for the pin code
  /// @throws ServerException for any errors returned by the platform
  Future<void> sendAddPinCode(String pinCode, String pinCodeName,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendCreatePinCodeMethod sendCreatePinCodeMethod =
          PinCodeRepository.sendCreatePinCodeAction}) async {
    return performAction<List<PinCodeCredential>>(
        [...?getPinCodeCredentials, PinCodeCredential(pinCodeName, pinCode)],
        () => getPinCodeCredentials,
        () => sendCreatePinCodeMethod(
            _request, this._deviceId, pinCode, pinCodeName),
        getDetails: getDetails);
  }

  PinCodeTrait? getPinCodeTrait() {
    return trait<PinCodeTrait>() as PinCodeTrait?;
  }

  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;

  /// Get pinCodeCredentials State
  List<PinCodeCredential>? get getPinCodeCredentials =>
      getPinCodeTrait()?.pinCodes;

  /// Get the Max Number Of Credentials allowed for this device
  int? get maxNumberOfCredentials => getPinCodeTrait()?.maxNumberOfCredentials;

  /// Get min and max Credential length allowed for this device
  PinCodeLengthRange? get pinCodeLengthRange =>
      getPinCodeTrait()?.pinCodeLengthRange;

  /// Get min and max pin code Name length allowed for this device
  PinCodeNameLengthRange? get nameLengthRange =>
      getPinCodeTrait()?.nameLengthRange;
}
