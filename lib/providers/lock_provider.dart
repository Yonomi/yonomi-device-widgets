import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/providers/widget_state.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

typedef SendLockUnlockFunction = Future<void> Function(
    Request request, String id, bool lockUnlock);

class LockProvider extends DeviceProvider {
  static const int _MAX_RETRIES = 10;
  static const _DEFAULT_DISPLAY_NAME = 'LOCK';

  LockProvider(Request request, String deviceId,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails})
      : super(request, deviceId, getDetails: getDetails) {
    _request = request;
  }

  late final Request _request;

  bool get isLocked => getLockTrait()?.state.value ?? false;

  LockTrait? getLockTrait() {
    return deviceDetail?.traits
        .firstWhere((trait) => trait is LockTrait, orElse: null) as LockTrait;
  }

  Future<void> setLockUnlockAction(String deviceId, bool setLock,
      {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
      SendLockUnlockFunction sendLockUnlock =
          LockRepository.sendLockUnlockAction}) async {
    if (!isPerformingAction) {
      setState = WidgetState.performingAction;

      try {
        await sendLockUnlock(_request, deviceId, setLock);

        int numRetries = 0;
        while (getLockTrait()?.state.value != setLock &&
            numRetries < _MAX_RETRIES) {
          // Wait more time
          await getDetails(_request, deviceId);
          await Future.delayed(Duration(milliseconds: 750));
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

  @override
  String get displayName => deviceDetail?.displayName ?? _DEFAULT_DISPLAY_NAME;
}
