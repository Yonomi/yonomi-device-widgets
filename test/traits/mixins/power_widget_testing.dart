import 'package:mockito/mockito.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../power_widget_test.mocks.dart';

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
