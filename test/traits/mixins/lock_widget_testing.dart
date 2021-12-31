import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../../components/lock_widget_test.mocks.dart';

@GenerateMocks([LockProvider])
mixin LockWidgetTesting {
  MockLockProvider mockLockProvider(Device device,
      {bool isLoading = false,
      bool isPerformingAction = false,
      bool isLocked = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.isLoading).thenReturn(isLoading);
    when(mockLockProvider.isPerformingAction).thenReturn(isPerformingAction);
    when(mockLockProvider.isLocked).thenReturn(isLocked);
    when(mockLockProvider.deviceDetail).thenReturn(device);

    return mockLockProvider;
  }
}
