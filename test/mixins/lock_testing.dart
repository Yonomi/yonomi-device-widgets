import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_testing.mocks.dart';


@GenerateMocks([LockProvider])
mixin LockTesting {
  MockLockProvider mockLockProvider(TestLockDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = 'Some mock error occurred',
      bool isPerformingAction = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.displayName).thenReturn(device.displayName);
    when(mockLockProvider.isLoading).thenReturn(isLoading);
    when(mockLockProvider.isPerformingAction).thenReturn(isPerformingAction);
    when(mockLockProvider.isBusy).thenReturn(isBusy);
    when(mockLockProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockLockProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockLockProvider.deviceDetail).thenReturn(device);
    when(mockLockProvider.getIsLockedState).thenReturn(device.isLocked);
    when(mockLockProvider.getIsJammedState).thenReturn(device.isJammed);

    when(mockLockProvider.getLockTrait()).thenReturn(device.traits
        .firstWhere((trait) => trait is LockTrait, orElse: null) as LockTrait?);

    return mockLockProvider;
  }
}

class TestLockDevice extends Device {
  final bool isLocked;
  final bool isJammed;
  final bool supportsIsJammed;

  TestLockDevice(Device device,
      {this.isLocked = false,
      this.isJammed = false,
      this.supportsIsJammed = false})
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          LockTrait(<State>{
            IsLocked(isLocked),
            IsJammed(isJammed)
          }, <Property>{
            SupportsIsJammed(supportsIsJammed),
          }),
          ...device.traits.where((t) => t.runtimeType != LockTrait)
        ]);

  TestLockDevice withIsLocked(bool isLocked) {
    return TestLockDevice(this,
        isLocked: isLocked,
        isJammed: this.isJammed,
        supportsIsJammed: this.supportsIsJammed);
  }

  TestLockDevice withJammed(bool isJammed) {
    return TestLockDevice(this,
        isLocked: this.isLocked,
        isJammed: isJammed,
        supportsIsJammed: this.supportsIsJammed);
  }

  TestLockDevice withSupportsIsJammed(bool supportsIsJammed) {
    return TestLockDevice(this,
        isLocked: this.isLocked,
        isJammed: this.isJammed,
        supportsIsJammed: supportsIsJammed);
  }
}
