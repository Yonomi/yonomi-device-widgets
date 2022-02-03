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
      bool isLocked = false,
      bool isInErrorState = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.isLoading).thenReturn(isLoading);
    when(mockLockProvider.isPerformingAction).thenReturn(isPerformingAction);
    when(mockLockProvider.isBusy).thenReturn(isPerformingAction || isLoading);
    when(mockLockProvider.getIsLockedState).thenReturn(isLocked);
    when(mockLockProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockLockProvider.deviceDetail).thenReturn(device);

    return mockLockProvider;
  }
}
