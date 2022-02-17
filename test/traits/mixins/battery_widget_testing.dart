import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'battery_widget_testing.mocks.dart';

@GenerateMocks([BatteryLevelProvider])
mixin BatteryWidgetTesting {
  MockBatteryLevelProvider mockBatteryLevelProvider(TestBatteryDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = 'Some mock error occurred',
      bool isPerformingAction = false}) {
    final mockBatteryLevelProvider = MockBatteryLevelProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(isLoading);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockBatteryLevelProvider.getErrorMessage)
        .thenReturn(errorMessage);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);
    when(mockBatteryLevelProvider.displayName).thenReturn('BATTERY');
    when(mockBatteryLevelProvider.getBatteryLevelState)
        .thenReturn(device.batteryLevel);
    when(mockBatteryLevelProvider.isPerformingAction)
        .thenReturn(isPerformingAction);

    return mockBatteryLevelProvider;
  }
}

class TestBatteryDevice extends Device {
  final int batteryLevel;

  TestBatteryDevice(Device device, {this.batteryLevel = 90})
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

  TestBatteryDevice withBatteryLevel(int batteryLevel) {
    return TestBatteryDevice(this, batteryLevel: batteryLevel);
  }
}
