import 'package:flutter_test/flutter_test.dart';
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
    AvailableFanMode fanMode = AvailableFanMode.AUTO,
    AvailableThermostatMode mode = AvailableThermostatMode.AUTO,
    Set<AvailableFanMode> availableFanModes = const {},
    Set<AvailableThermostatMode> availableThermostatModes = const {},
  }) {
    final mockThermostatProvider = MockThermostatProvider();
    when(mockThermostatProvider.isLoading).thenReturn(isLoading);
    when(mockThermostatProvider.isBusy).thenReturn(isBusy);
    when(mockThermostatProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockThermostatProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockThermostatProvider.isPerformingAction).thenReturn(false);
    when(mockThermostatProvider.deviceDetail).thenReturn(device);
    when(mockThermostatProvider.displayName).thenReturn('THERMOSTAT');

    when(mockThermostatProvider.setThermostatMode(device.id, any))
        .thenAnswer((_) => Future.value());

    when(mockThermostatProvider.setFanMode(device.id, any))
        .thenAnswer((_) => Future.value());

    final thermostatTrait =
        device.traits.firstWhere((trait) => trait is ThermostatTrait,
            orElse: () => ThermostatTrait({
                  TargetTemperature(targetTemperature),
                  FanMode(fanMode)
                }, {
                  AvailableFanModes(availableFanModes),
                  AvailableThermostatModes(availableThermostatModes)
                })) as ThermostatTrait?;
    when(mockThermostatProvider.getThermostatTrait())
        .thenReturn(thermostatTrait);
    when(mockThermostatProvider.getTargetTemperatureState).thenReturn(
        thermostatTrait?.states
            .firstWhere((state) => state is TargetTemperature)
            .value);
    when(mockThermostatProvider.getFanModeState).thenReturn(thermostatTrait
        ?.states
        .firstWhere((state) => state is FanMode, orElse: () => FanMode(fanMode))
        .value);
    when(mockThermostatProvider.getModeState).thenReturn(thermostatTrait?.states
        .firstWhere((state) => state is ThermostatMode,
            orElse: () => ThermostatMode(mode))
        .value);
    when(mockThermostatProvider.getAvailableFanModes)
        .thenReturn(availableFanModes);
    when(mockThermostatProvider.getAvailableThermostatModes)
        .thenReturn(availableThermostatModes);

    return mockThermostatProvider;
  }
}
