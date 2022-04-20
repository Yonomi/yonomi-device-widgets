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
    when(mockColorProvider.getColorState).thenReturn(device.colorState.value);
    when(mockColorProvider.setColorAction(any))
        .thenAnswer((_) => Future.value(null));

    return mockColorProvider;
  }
}

class TestColorDevice extends Device {
  late final HSBColor colorState;
  TestColorDevice(Device device, {HSBColor? colorState})
      : this.colorState = colorState ?? HSBColor(130, 50, 50),
        super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          ColorTrait(colorState ?? HSBColor(130, 50, 50)),
          ...device.traits.where((t) => t.runtimeType != ColorTrait)
        ]);

  TestColorDevice withColor(HSBColor colorState) {
    return TestColorDevice(this, colorState: colorState);
  }
}
