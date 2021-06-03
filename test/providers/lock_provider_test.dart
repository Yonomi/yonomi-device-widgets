import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class MockGetLockDetailsFunction extends Mock {
  Future<Device> call(Request request, String id);
}

class MockSendLockUnlockFunction extends Mock {
  Future<void> call(Request request, String id, bool lockUnlock);
}

void main() {
  test('Calling setLockUnlockAction calls repository method', () async {
    Request request = Request("", {});
    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    SendLockUnlockFunction mockSendLockUnlockMethod =
        MockSendLockUnlockFunction();
    LockProvider lockProvider = LockProvider(request, "deviceId");

    await lockProvider.setLockUnlockAction("deviceId", true,
        injectLockDetailsMethod: mockLockDetailsMethod,
        injectSendLockUnlockMethod: mockSendLockUnlockMethod);

    verify(mockSendLockUnlockMethod(any, any, any)).called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    LockProvider lockProvider = LockProvider(request, "deviceId");

    await lockProvider.getDeviceDetail(
        deviceId: "test", injectLockDetailsMethod: mockLockDetailsMethod);

    verify(mockLockDetailsMethod(any, any)).called(1);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    GetLockDetailsFunction mockLockDetailsMethod = MockGetLockDetailsFunction();
    when(mockLockDetailsMethod(any, any)).thenAnswer((_) => Future.value(
          Device(
            "someId",
            "someDisplayName",
            "someDescription",
            "someManufacturerName",
            "someModel",
            "someFirmwareV",
            "someSoftwareV",
            "someSerialNumber",
            DateTime.now(),
            DateTime.now(),
            [],
          ),
        ));
    LockProvider lockProvider = LockProvider(request, "deviceId");

    await lockProvider.getDeviceDetail(
        deviceId: "test", injectLockDetailsMethod: mockLockDetailsMethod);

    expect(lockProvider.deviceDetail.displayName, "someDisplayName");
  });
}
