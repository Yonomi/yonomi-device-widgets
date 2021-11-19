import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_provider_test.mocks.dart';

class GetLockDetails extends Mock {
  Future<Device> call(Request request, String id);
}

class SendLockUnlock extends Mock {
  Future<void> call(Request request, String id, bool lockUnlock);
}

@GenerateMocks([GetLockDetails, SendLockUnlock])
void main() {
  test('Calling setLockUnlockAction calls repository method', () async {
    Request request = Request("", {});
    final mockLockDetailsMethod = MockGetLockDetails();
    final device = Device(
        'id',
        'name',
        'description',
        'manufacturerName',
        'model',
        null,
        GDateTime('value'),
        GDateTime('value'),
        [LockTrait('name', IsLocked(true))]);
    when(mockLockDetailsMethod.call(request, "deviceId"))
        .thenAnswer((_) => Future.value(device));
    final mockSendLockUnlockMethod = MockSendLockUnlock();
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);
    await lockProvider.setLockUnlockAction('deviceId', true,
        lockDetails: mockLockDetailsMethod,
        sendLockUnlock: mockSendLockUnlockMethod);
    verify(mockLockDetailsMethod(request, 'deviceId')).called(1);

    verify(mockSendLockUnlockMethod(request, 'deviceId', true)).called(1);
  });

  test(
      'setLockUnlockAction will retry calling repository method multiple times if state value has not yet changed',
      () async {
    Request request = Request("", {});
    final mockLockDetailsMethod = MockGetLockDetails();
    final device = Device(
        'id',
        'name',
        'description',
        'manufacturerName',
        'model',
        null,
        GDateTime('value'),
        GDateTime('value'),
        [LockTrait('name', IsLocked(false))]);
    when(mockLockDetailsMethod.call(request, "deviceId"))
        .thenAnswer((_) => Future.value(device));
    final mockSendLockUnlockMethod = MockSendLockUnlock();
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);

    await lockProvider.setLockUnlockAction('deviceId', true,
        lockDetails: mockLockDetailsMethod,
        sendLockUnlock: mockSendLockUnlockMethod);

    verify(mockSendLockUnlockMethod(request, 'deviceId', true)).called(1);
    verify(mockLockDetailsMethod(request, 'deviceId')).called(11);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    final mockLockDetailsMethod = MockGetLockDetails();
    final device = Device(
        'test',
        'name',
        'description',
        'manufacturerName',
        'model',
        null,
        GDateTime('value'),
        GDateTime('value'),
        [LockTrait('name', IsLocked(true))]);
    when(mockLockDetailsMethod.call(request, 'test'))
        .thenAnswer((_) => Future.value(device));
    LockProvider lockProvider =
        LockProvider(request, 'test', getLockDetails: mockLockDetailsMethod);

    await lockProvider.getDeviceDetail('test',
        getLockDetails: mockLockDetailsMethod);

    verify(mockLockDetailsMethod(request, 'test')).called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetails();
    when(mockLockDetailsMethod.call(request, 'deviceId'))
        .thenAnswer((_) => Future.value(
              Device(
                "someId",
                "someDisplayName",
                "someDescription",
                "someManufacturerName",
                "someModel",
                "someFirmwareV",
                GDateTime('value'),
                GDateTime('value'),
                [],
              ),
            ));
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);

    await lockProvider.getDeviceDetail('deviceId',
        getLockDetails: mockLockDetailsMethod);

    expect(lockProvider.deviceDetail.displayName, 'someDisplayName');
  });
}
