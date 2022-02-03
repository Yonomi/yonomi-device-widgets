import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'thermostat_widget_testing.mocks.dart';

@GenerateMocks([ThermostatProvider])
mixin ThermostatWidgetTesting {
  MockThermostatProvider mockThermostatProvider(
    Device device, {
    bool isBusy = false,
    bool isLoading = false,
    bool isInErrorState = false,
    bool isPerformingAction = false,
    String errorMessage = '',
    double targetTemperature = 70.0,
    String fanMode = 'AUTO',
    Set<AvailableFanMode> availableFanModes = const {},
  }) {
    final mockThermostatProvider = MockThermostatProvider();
    when(mockThermostatProvider.isLoading).thenReturn(isLoading);
    when(mockThermostatProvider.isBusy).thenReturn(isBusy);
    when(mockThermostatProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockThermostatProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockThermostatProvider.isPerformingAction).thenReturn(false);
    when(mockThermostatProvider.deviceDetail).thenReturn(device);
    when(mockThermostatProvider.displayName).thenReturn('THERMOSTAT');
    when(mockThermostatProvider.getAvailableFanModes)
        .thenReturn(availableFanModes);

    final thermostatTrait = device.traits.firstWhere(
            (trait) => trait is ThermostatTrait,
            orElse: () => ThermostatTrait(
                {TargetTemperature(targetTemperature), FanMode(fanMode)}))
        as ThermostatTrait?;
    when(mockThermostatProvider.getTargetTemperatureState).thenReturn(
        thermostatTrait?.states
            .firstWhere((state) => state is TargetTemperature)
            .value);
    when(mockThermostatProvider.getFanModeState).thenReturn(thermostatTrait
        ?.states
        .firstWhere((state) => state is FanMode, orElse: () => FanMode(fanMode))
        .value);

    return mockThermostatProvider;
  }
}
