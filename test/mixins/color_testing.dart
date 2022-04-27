import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'color_testing.mocks.dart';

@GenerateMocks([ColorProvider])
mixin ColorTesting {
  MockColorProvider mockColorProvider(TestColorDevice device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      bool isPerformingAction = false,
      String errorMessage = ''}) {
    final mockColorProvider = MockColorProvider();
    when(mockColorProvider.displayName).thenReturn(device.displayName);
    when(mockColorProvider.isLoading).thenReturn(isLoading);
    when(mockColorProvider.isBusy).thenReturn(isBusy);
    when(mockColorProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockColorProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockColorProvider.isPerformingAction).thenReturn(isPerformingAction);

    when(mockColorProvider.deviceDetail).thenReturn(device);
    when(mockColorProvider.getColorState)
        .thenReturn(device.colorTrait?.color);
    when(mockColorProvider.setColorAction(any))
        .thenAnswer((_) => Future.value(null));

    final colorTrait = device.traits.firstWhere((trait) => trait is ColorTrait,
        orElse: () => UnknownTrait(device.displayName));
    if (colorTrait is UnknownTrait) {
      when(mockColorProvider.getColorTrait).thenReturn(null);
    } else {
      when(mockColorProvider.getColorTrait)
          .thenReturn(colorTrait as ColorTrait);
    }

    return mockColorProvider;
  }
}

class TestColorDevice extends Device {
  late final ColorTrait? colorTrait;
  TestColorDevice(Device device, {this.colorTrait})
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt,
            [
              colorTrait,
              ...device.traits.where((t) => t.runtimeType != ColorTrait)
            ].whereType<Trait>().toList());

  TestColorDevice withColor(HSBColor? colorState) {
    if (colorState == null) {
      return TestColorDevice(this, colorTrait: null);
    } else {
      return TestColorDevice(this, colorTrait: ColorTrait(colorState));
    }
  }
}
