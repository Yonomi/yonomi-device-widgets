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
    when(mockBatteryLevelProvider.getErrorMessage)
        .thenReturn('Some mock error occurred');
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);
    when(mockBatteryLevelProvider.displayName).thenReturn('BATTERY');
    when(mockBatteryLevelProvider.getBatteryLevelState)
        .thenReturn(batteryLevel);
    when(mockBatteryLevelProvider.isPerformingAction).thenReturn(false);

    return mockBatteryLevelProvider;
  }
}

class TestBattery extends Device {
  final int batteryLevel;

  TestBattery(Device device, {this.batteryLevel = 90})
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          BatteryLevelTrait(BatteryLevel(batteryLevel)),
          ...device.traits.where((t) => t.runtimeType != BatteryLevelTrait)
        ]);

  TestBattery withBatteryLevel(int batteryLevel) {
    return TestBattery(this, batteryLevel: batteryLevel);
  }
}
