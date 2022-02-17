import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_widget_testing.mocks.dart';

@GenerateMocks([LockProvider])
mixin LockWidgetTesting {
  MockLockProvider mockLockProvider(Device device,
      {bool isLoading = false,
      bool isPerformingAction = false,
      bool supportsIsJammed = false,
      bool isLocked = false,
      bool isJammed = false,
      bool isInErrorState = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.displayName).thenReturn(device.displayName);
    when(mockLockProvider.isLoading).thenReturn(isLoading);
    when(mockLockProvider.isPerformingAction).thenReturn(isPerformingAction);
    when(mockLockProvider.isBusy).thenReturn(isPerformingAction || isLoading);

    when(mockLockProvider.getIsLockedState).thenReturn(isLocked);
    when(mockLockProvider.getIsJammedState).thenReturn(isJammed);
    when(mockLockProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockLockProvider.deviceDetail).thenReturn(device);

    final lockTrait = device.traits.firstWhere((trait) => trait is LockTrait,
        orElse: () => LockTrait({
              IsLocked(isLocked),
              if (supportsIsJammed) IsJammed(isJammed),
            }, {
              SupportsIsJammed(supportsIsJammed)
            })) as LockTrait?;
    when(mockLockProvider.getLockTrait()).thenReturn(lockTrait);

    return mockLockProvider;
  }
}
