import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'device_provider.dart';

typedef DoAction = Future<void> Function(Request request, String deviceId);
typedef GetDeviceDetails = Future<Device> Function(
    Request request, String deviceId);

class UnknownProvider extends DeviceProvider {
  UnknownProvider(Request request, String deviceId) : super(request, deviceId);

  Trait getTrait() {
    return deviceDetails.traits
        .skipWhile((trait) => !(trait is UnknownTrait))
        .first;
  }

  Future<void> performAction(String deviceId,
      {DoAction doAction = doAction}) async {
    loadingAction = true;
    notifyListeners();

    final traitValue = getTrait().state.value;
    await doAction(request, deviceId);

    var retries = 0;
    while (traitValue == getTrait().state.value && retries++ < 10) {
      getDeviceDetails(deviceId).timeout(Duration(milliseconds: 750));
      await Future.delayed(Duration(milliseconds: 750));
    }

    loadingAction = false;
    notifyListeners();
  }

  // todo(Delete after repository function exists to assign to doAction)
  static Future<void> doAction(Request request, String deviceId) async {
    throw UnimplementedError();
  }
}
