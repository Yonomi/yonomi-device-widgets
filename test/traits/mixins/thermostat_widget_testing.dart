import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'thermostat_widget_testing.mocks.dart';

@GenerateMocks([ThermostatProvider])
mixin ThermostatWidgetTesting {
  MockThermostatProvider mockThermostatProvider(Device device) {
    final mockThermostatProvider = MockThermostatProvider();
    when(mockThermostatProvider.isLoading).thenReturn(false);
    when(mockThermostatProvider.isInErrorState).thenReturn(false);
    when(mockThermostatProvider.deviceDetail).thenReturn(device);
    when(mockThermostatProvider.displayName).thenReturn('THERMOSTAT');
    when(mockThermostatProvider.isPerformingAction).thenReturn(false);
    when(mockThermostatProvider.targetTemperature).thenReturn(device.traits
        .firstWhere((trait) => trait.state is TargetTemperature,
            orElse: () => ThermostatTrait(TargetTemperature(70.0)))
        .state
        .value);

    return mockThermostatProvider;
  }
}
