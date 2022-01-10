import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'power_widget_testing.mocks.dart';

@GenerateMocks([PowerTraitProvider])
mixin PowerWidgetTesting {
  MockPowerTraitProvider mockPowerTraitProvider(Device device,
      {bool isBusy = false,
      bool isLoading = false,
      bool isInErrorState = false,
      String errorMessage = '',
      bool onOffState = true,
      bool isPerformingAction = false}) {
    final mockPowerTraitProvider = MockPowerTraitProvider();
    when(mockPowerTraitProvider.isLoading).thenReturn(isLoading);
    when(mockPowerTraitProvider.isBusy).thenReturn(isBusy);
    when(mockPowerTraitProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockPowerTraitProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockPowerTraitProvider.getOnOffState).thenReturn(onOffState);
    when(mockPowerTraitProvider.isPerformingAction)
        .thenReturn(isPerformingAction);
    when(mockPowerTraitProvider.deviceDetail).thenReturn(device);

    return mockPowerTraitProvider;
  }
}
