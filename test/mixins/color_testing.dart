import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'color_testing.mocks.dart';

@GenerateMocks([ColorProvider])
mixin ColorTesting {
  MockColorProvider mockColorProvider(TestColorDevice device) {
    final mockColorProvider = MockColorProvider();
    when(mockColorProvider.displayName).thenReturn(device.displayName);
    when(mockColorProvider.deviceDetail).thenReturn(device);
    return mockColorProvider;
  }
}

class TestColorDevice extends Device {
  TestColorDevice(Device device)
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          ...device.traits // .where((t) => t.runtimeType != ColorTrait)
        ]);

  TestColorDevice withColor(param0) {
    return this;
  }
}
