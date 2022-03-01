import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'brightness_testing.mocks.dart';

@GenerateMocks([BrightnessProvider])
mixin BrightnessTesting {
  MockBrightnessProvider mockBrightnessProvider(TestBrightnessDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = 'Some mock error occurred',
      bool isPerformingAction = false}) {
    final mockBrightnessProvider = MockBrightnessProvider();
    when(mockBrightnessProvider.displayName).thenReturn(device.displayName);
    when(mockBrightnessProvider.isLoading).thenReturn(isLoading);
    when(mockBrightnessProvider.isPerformingAction)
        .thenReturn(isPerformingAction);
    when(mockBrightnessProvider.isBusy).thenReturn(isBusy);
    when(mockBrightnessProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockBrightnessProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockBrightnessProvider.deviceDetail).thenReturn(device);

    when(mockBrightnessProvider.getBrightnessState)
        .thenReturn(device.brightness);

    when(mockBrightnessProvider.setBrightnessLevelAction(any))
        .thenAnswer((_) => Future.value());

    return mockBrightnessProvider;
  }
}

class TestBrightnessDevice extends Device {
  final int? brightness;

  TestBrightnessDevice(Device device, {this.brightness = 80})
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          BrightnessTrait(
            Brightness(brightness),
          ),
          ...device.traits.where((t) => t.runtimeType != BrightnessTrait)
        ]);

  TestBrightnessDevice withBrightness(int? brightness) {
    return TestBrightnessDevice(this, brightness: brightness);
  }
}
