import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class MockDevicesRepo extends Mock implements DevicesRepositoryWrapper {}

class MockLockRepo extends Mock implements LockRepositoryWrapper {}

void main() {
  test('Calling setLockUnlockAction calls repository method', () async {
    Request request = Request("", {});
    DevicesRepositoryWrapper mockDevicesRepo = MockDevicesRepo();
    LockRepositoryWrapper mockLockRepo = MockLockRepo();
    LockProvider lockProvider = LockProvider(request, "deviceId");
    lockProvider.lockRepo = mockLockRepo;
    lockProvider.deviceRepo = mockDevicesRepo;

    await lockProvider.setLockUnlockAction("deviceId", true);

    verify(mockLockRepo.sendLockUnlockAction(any, any, any)).called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    DevicesRepositoryWrapper mockDevicesRepo = MockDevicesRepo();
    LockProvider lockProvider = LockProvider(request, "deviceId");
    lockProvider.deviceRepo = mockDevicesRepo;

    await lockProvider.getDeviceDetail(deviceId: "test");

    verify(mockDevicesRepo.getLockDetails(any, any)).called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});

    DevicesRepositoryWrapper mockDevicesRepo = MockDevicesRepo();
    when(mockDevicesRepo.getLockDetails(any, any))
        .thenAnswer((_) => Future.value(
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
    lockProvider.deviceRepo = mockDevicesRepo;

    await lockProvider.getDeviceDetail(deviceId: "test");

    expect(lockProvider.deviceDetail.displayName, "someDisplayName");
  });
}
