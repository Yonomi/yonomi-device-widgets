import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class MockGetLockDetailsFunction extends Mock {
  Future<Device> call(Request request, String id);
}

class MockSendLockUnlockFunction extends Mock {
  Future<Device> call(Request request, String id, bool lockUnlock);
}

// @GenerateMocks([])

void main() {
  test('Calling setLockUnlockAction calls repository method', () async {
    Request request = Request("", {});
    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    SendLockUnlockFunction mockSendLockUnlockMethod =
        MockSendLockUnlockFunction();
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);

    await lockProvider.setLockUnlockAction('deviceId', true,
        lockDetails: mockLockDetailsMethod,
        sendLockUnlock: mockSendLockUnlockMethod);

    verify(mockSendLockUnlockMethod(request, 'deviceId', false)).called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);

    await lockProvider.getDeviceDetail('test',
        getLockDetails: mockLockDetailsMethod);

    verify(mockLockDetailsMethod(request, 'deviceId')).called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    when(mockLockDetailsMethod(request, 'deviceId'))
        .thenAnswer((_) => Future.value(
              Device(
                "someId",
                "someDisplayName",
                "someDescription",
                "someManufacturerName",
                "someModel",
                "someFirmwareV",
                GDateTime(),
                GDateTime(),
                [],
              ),
            ));
    LockProvider lockProvider = LockProvider(request, 'deviceId',
        getLockDetails: mockLockDetailsMethod);

    await lockProvider.getDeviceDetail('test',
        getLockDetails: mockLockDetailsMethod);

    expect(lockProvider.deviceDetail.displayName, 'someDisplayName');
  });
}
