import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'power_widget_testing.mocks.dart';

@GenerateMocks([PowerTraitProvider])
mixin PowerWidgetTesting {
  MockPowerTraitProvider mockPowerTraitProvider(Device device,
      {bool isBusy = false,
      bool isInErrorState = false,
      String errorMessage = '',
      bool onOffState = true}) {
    final mockPowerTraitProvider = MockPowerTraitProvider();
    when(mockPowerTraitProvider.isBusy).thenReturn(isBusy);
    when(mockPowerTraitProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockPowerTraitProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockPowerTraitProvider.getOnOffState).thenReturn(onOffState);

    return mockPowerTraitProvider;
  }
}
