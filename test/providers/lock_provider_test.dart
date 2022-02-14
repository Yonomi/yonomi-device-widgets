import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendLockUnlock extends Mock {
  Future<void> call(Request request, String id, bool lockUnlock);
}

@GenerateMocks([GetDeviceDetailsMethod, SendLockUnlock])
void main() {
  test(
      'setLockUnlockAction will retry calling repository method multiple times if state value has not yet changed',
      () async {
    Request request = Request("", {});
    final mockLockDetailsMethod = MockGetDeviceDetailsMethod();
    final device = _getDevice(false);
    when(mockLockDetailsMethod.call(request, "deviceId"))
        .thenAnswer((_) => Future.value(device));
    final mockSendLockUnlockMethod = MockSendLockUnlock();
    LockProvider lockProvider =
        LockProvider(request, 'deviceId', getDetails: mockLockDetailsMethod);

    await lockProvider.setLockUnlockAction('deviceId', true,
        getDetails: mockLockDetailsMethod,
        sendLockUnlock: mockSendLockUnlockMethod);

    verify(mockSendLockUnlockMethod(request, 'deviceId', true)).called(1);
    verify(mockLockDetailsMethod(request, 'deviceId')).called(11);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    final mockLockDetailsMethod = MockGetDeviceDetailsMethod();
    final device = _getDevice(true);
    when(mockLockDetailsMethod.call(request, 'test'))
        .thenAnswer((_) => Future.value(device));
    LockProvider lockProvider =
        LockProvider(request, 'test', getDetails: mockLockDetailsMethod);

    await lockProvider.fetchData(getDetails: mockLockDetailsMethod);

    verify(mockLockDetailsMethod(request, 'test')).called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    final mockLockDetailsMethod = MockGetDeviceDetailsMethod();
    when(mockLockDetailsMethod.call(request, 'deviceId'))
        .thenAnswer((_) => Future.value(
              _getDevice(true),
            ));
    LockProvider lockProvider =
        LockProvider(request, 'deviceId', getDetails: mockLockDetailsMethod);

    await lockProvider.fetchData(getDetails: mockLockDetailsMethod);

    expect(lockProvider.displayName, 'name');
    expect(lockProvider.isLoading, equals(false));
    expect(lockProvider.isInErrorState, equals(false));
    expect(lockProvider.isBusy, equals(false));
    expect(lockProvider.isPerformingAction, equals(false));
    expect(lockProvider.getIsLockedState, true);
    expect(lockProvider.getLockTrait(), isA<LockTrait>());
  });

  test("""When loading device data, we are notified that it is loading
        through isLoading.""", () {
    Request request = Request("", {});
    Device device = _getDevice(true);

    final mockLockDetailsMethod = MockGetDeviceDetailsMethod();
    when(mockLockDetailsMethod.call(request, device.id))
        .thenAnswer((_) => Future.value(device));
    LockProvider lockProvider =
        LockProvider(request, device.id, getDetails: mockLockDetailsMethod);

    expect(lockProvider.isLoading, equals(true), reason: 'isLoading');
    expect(lockProvider.displayName, 'LOCK');
    expect(lockProvider.isInErrorState, equals(false));
    expect(lockProvider.isBusy, equals(true));
    expect(lockProvider.isPerformingAction, equals(false));

    expect(lockProvider.getIsLockedState, false);
  });

  test("""When an error occurs running an action, we are notified
        an error occurred using isInErrorState and get
        an error message with getErrorMessage.""", () async {
    Request request = Request("", {});
    String deviceId = 'aDeviceId';

    String exceptionMesssage = 'Throwing an exception';

    MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
        MockGetDeviceDetailsMethod();

    MockSendLockUnlock mockSendLockUnlock = MockSendLockUnlock();
    when(mockSendLockUnlock.call(request, deviceId, true))
        .thenAnswer((_) => throw (exceptionMesssage));

    final lockProvider =
        LockProvider(request, deviceId, getDetails: mockDeviceDetailsMethod);

    lockProvider.setLockUnlockAction(deviceId, true,
        getDetails: mockDeviceDetailsMethod,
        sendLockUnlock: mockSendLockUnlock);

    await Future.delayed(Duration(milliseconds: 100));

    expect(lockProvider.isInErrorState, equals(true));
    expect(lockProvider.getErrorMessage, equals(exceptionMesssage));

    await Future.delayed(Duration(seconds: 1));
    expect(lockProvider.isInErrorState, equals(false));
  });
}

Device _getDevice(bool isLocked) {
  return Device('id', 'name', 'description', 'manufacturerName', 'model', null,
      GDateTime('value'), GDateTime('value'), [
    LockTrait({IsLocked(isLocked)}, {SupportsIsJammed(false)})
  ]);
}
