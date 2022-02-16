import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'power_widget_testing.mocks.dart';

@GenerateMocks([PowerTraitProvider])
mixin PowerWidgetTesting {
  MockPowerTraitProvider mockPowerTraitProvider(TestPower device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = '',
      bool isPerformingAction = false}) {
    final mockPowerTraitProvider = MockPowerTraitProvider();
    when(mockPowerTraitProvider.isLoading).thenReturn(isLoading);
    when(mockPowerTraitProvider.isBusy).thenReturn(isBusy);
    when(mockPowerTraitProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockPowerTraitProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockPowerTraitProvider.getOnOffState).thenReturn(device.isOn);
    when(mockPowerTraitProvider.supportsDiscreteOnOff)
        .thenReturn(device.supportsDiscreteOnOff);
    when(mockPowerTraitProvider.isPerformingAction)
        .thenReturn(isPerformingAction);
    when(mockPowerTraitProvider.deviceDetail).thenReturn(device);

    return mockPowerTraitProvider;
  }
}

class TestPower extends Device {
  final bool isOn;
  final bool supportsDiscreteOnOff;

  TestPower(Device device,
      {this.isOn = true, this.supportsDiscreteOnOff = true})
      : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          PowerTrait(IsOnOff(isOn),
              supportsDiscreteOnOff:
                  SupportsDiscreteOnOff(supportsDiscreteOnOff)),
          ...device.traits.where((t) => t.runtimeType != PowerTrait)
        ]);

  TestPower withIsOn(bool isOn) {
    return TestPower(this, isOn: isOn);
  }

  TestPower withSupportsDiscreteOnOff(bool supportsDiscreteOnOff) {
    return TestPower(this, supportsDiscreteOnOff: supportsDiscreteOnOff);
  }
}
