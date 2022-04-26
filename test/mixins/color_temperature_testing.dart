import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'color_temperature_testing.mocks.dart';

@GenerateMocks([ColorTemperatureProvider])
mixin ColorTemperatureTesting {
  MockColorTemperatureProvider mockColorTemperatureProvider(
      TestColorTemperatureDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = 'Some mock error occurred',
      bool isPerformingAction = false}) {
    final mockColorTemperatureProvider = MockColorTemperatureProvider();

    when(mockColorTemperatureProvider.displayName)
        .thenReturn(device.displayName);
    when(mockColorTemperatureProvider.isLoading).thenReturn(isLoading);
    when(mockColorTemperatureProvider.isPerformingAction)
        .thenReturn(isPerformingAction);
    when(mockColorTemperatureProvider.isBusy).thenReturn(isBusy);
    when(mockColorTemperatureProvider.isInErrorState)
        .thenReturn(isInErrorState);
    when(mockColorTemperatureProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockColorTemperatureProvider.deviceDetail).thenReturn(device);

    when(mockColorTemperatureProvider.getColorTemperatureState)
        .thenReturn(device.colorTemperature);

    when(mockColorTemperatureProvider.getMinColorTemperature)
        .thenReturn(device.minColorTemperature);

    when(mockColorTemperatureProvider.getMaxColorTemperature)
        .thenReturn(device.maxColorTemperature);

    when(mockColorTemperatureProvider.setColorTemperatureAction(any))
        .thenAnswer((_) => Future.value());

    return mockColorTemperatureProvider;
  }
}

class TestColorTemperatureDevice extends Device {
  final int? colorTemperature;
  final int? minColorTemperature;
  final int? maxColorTemperature;

  TestColorTemperatureDevice(
    Device device, {
    this.colorTemperature = 3500,
    this.minColorTemperature = 1000,
    this.maxColorTemperature = 7000,
  }) : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          ColorTemperatureTrait(
            {ColorTemperature(colorTemperature)},
            {
              SupportedColorTemperatureRange(IntRange(
                min: minColorTemperature,
                max: maxColorTemperature,
              ))
            },
          ),
          ...device.traits.where((t) => t.runtimeType != ColorTemperatureTrait)
        ]);

  TestColorTemperatureDevice withColorTemperature(int? colorTemperature) {
    return TestColorTemperatureDevice(this, colorTemperature: colorTemperature);
  }
}
