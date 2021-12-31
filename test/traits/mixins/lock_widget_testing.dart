import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../lock_test.mocks.dart';

@GenerateMocks([LockProvider])
mixin LockWidgetTesting {
  MockLockProvider mockLockProvider(Device device,
      {bool loadingDetail = false,
      bool loadingAction = false,
      bool isLocked = false}) {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.loadingDetail).thenReturn(loadingDetail);
    when(mockLockProvider.loadingAction).thenReturn(loadingAction);
    when(mockLockProvider.isLocked).thenReturn(isLocked);
    when(mockLockProvider.deviceDetail).thenReturn(device);

    return mockLockProvider;
  }
}
