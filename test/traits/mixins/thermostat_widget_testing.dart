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

    final thermostatTrait = device.traits.firstWhere(
            (trait) => trait is ThermostatTrait,
            orElse: () =>
                ThermostatTrait({TargetTemperature(70.0), FanMode('AUTO')}))
        as ThermostatTrait?;
    when(mockThermostatProvider.targetTemperature).thenReturn(thermostatTrait
        ?.states
        .firstWhere((state) => state is TargetTemperature)
        .value);
    when(mockThermostatProvider.fanMode).thenReturn(thermostatTrait?.states
        .firstWhere((state) => state is FanMode, orElse: () => FanMode('AUTO'))
        .value);

    return mockThermostatProvider;
  }
}
