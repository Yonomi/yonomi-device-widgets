import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_widget_testing.mocks.dart';

@GenerateMocks([LockProvider])
mixin LockWidgetTesting {
  MockLockProvider mockLockProvider(TestLock device,
      {bool isLoading = false,
      bool isPerformingAction = false,
      bool isInErrorState = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.isLoading).thenReturn(isLoading);
    when(mockLockProvider.isPerformingAction).thenReturn(isPerformingAction);
    when(mockLockProvider.isBusy).thenReturn(isPerformingAction || isLoading);
    when(mockLockProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockLockProvider.deviceDetail).thenReturn(device);
    when(mockLockProvider.getIsLockedState).thenReturn(device.isLocked);

    return mockLockProvider;
  }
}

class TestLock extends Device {
  bool isLocked;
  bool isJammed;
  bool supportsIsJammed;

  TestLock(Device device,
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

  TestLock withIsLocked(bool isLocked) {
    return TestLock(this,
        isLocked: isLocked,
        isJammed: this.isJammed,
        supportsIsJammed: this.supportsIsJammed);
  }
}
