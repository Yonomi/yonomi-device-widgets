import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'battery_widget_testing.mocks.dart';

@GenerateMocks([BatteryLevelProvider])
mixin BatteryWidgetTesting {
  MockBatteryLevelProvider mockBatteryLevelProvider(Device device,
      {int batteryLevel = 90}) {
    final mockBatteryLevelProvider = MockBatteryLevelProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(false);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);
    when(mockBatteryLevelProvider.displayName).thenReturn('BATTERY');
    when(mockBatteryLevelProvider.getBatteryLevel).thenReturn(batteryLevel);

    return mockBatteryLevelProvider;
  }
}
