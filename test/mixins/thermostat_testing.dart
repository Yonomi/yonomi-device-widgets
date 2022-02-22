import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'thermostat_testing.mocks.dart';

@GenerateMocks([ThermostatProvider])
mixin ThermostatTesting {
  MockThermostatProvider mockThermostatProvider(
    TestThermostatDevice device, {
    bool isBusy = false,
    bool isLoading = false,
    bool isInErrorState = false,
    bool isPerformingAction = false,
    String errorMessage = '',
  }) {
    final mockThermostatProvider = MockThermostatProvider();
    when(mockThermostatProvider.isLoading).thenReturn(isLoading);
    when(mockThermostatProvider.isBusy).thenReturn(isBusy);
    when(mockThermostatProvider.isInErrorState).thenReturn(isInErrorState);
    when(mockThermostatProvider.getErrorMessage).thenReturn(errorMessage);
    when(mockThermostatProvider.isPerformingAction).thenReturn(false);
    when(mockThermostatProvider.deviceDetail).thenReturn(device);
    when(mockThermostatProvider.displayName).thenReturn(device.displayName);

    when(mockThermostatProvider.setThermostatMode(device.id, any))
        .thenAnswer((_) => Future.value());
    when(mockThermostatProvider.setFanMode(device.id, any))
        .thenAnswer((_) => Future.value());

    final ThermostatTrait thermostatTrait = device.traits
        .firstWhere((trait) => trait is ThermostatTrait) as ThermostatTrait;

    when(mockThermostatProvider.getThermostatTrait())
        .thenReturn(thermostatTrait);

    when(mockThermostatProvider.getTargetTemperatureState)
        .thenReturn(device.targetTemperature);
    when(mockThermostatProvider.getAmbientTemperatureState)
        .thenReturn(device.ambientTemperature);
    when(mockThermostatProvider.getFanModeState).thenReturn(device.fanMode);
    when(mockThermostatProvider.getModeState).thenReturn(device.mode);
    when(mockThermostatProvider.getAvailableFanModes)
        .thenReturn(device.availableFanModes);
    when(mockThermostatProvider.getAvailableThermostatModes)
        .thenReturn(device.availableThermostatModes);
    when(mockThermostatProvider.getCoolTemperatureRange)
        .thenReturn(TemperatureRange(min: 10, max: 30));
    when(mockThermostatProvider.getHeatTemperatureRange)
        .thenReturn(TemperatureRange(min: 20, max: 50));
    return mockThermostatProvider;
  }
}

class TestThermostatDevice extends Device {
  final double targetTemperature;
  final double ambientTemperature;
  final AvailableFanMode fanMode;
  final AvailableThermostatMode mode;
  final Set<AvailableFanMode> availableFanModes;
  final Set<AvailableThermostatMode> availableThermostatModes;
  late final TemperatureRange heatingRange;
  late final TemperatureRange coolingRange;

  TestThermostatDevice(
    Device device, {
    this.targetTemperature = 70.0,
    this.ambientTemperature = 68.8,
    this.fanMode = AvailableFanMode.AUTO,
    this.mode = AvailableThermostatMode.AUTO,
    this.availableFanModes = const {
      AvailableFanMode.AUTO,
      AvailableFanMode.ON,
      AvailableFanMode.ECO,
      AvailableFanMode.HUMIDITY
    },
    this.availableThermostatModes = const {
      AvailableThermostatMode.COOL,
      AvailableThermostatMode.HEAT,
      AvailableThermostatMode.OFF,
      AvailableThermostatMode.FANONLY,
      AvailableThermostatMode.AIRFLOW,
      AvailableThermostatMode.DEHUMIDIFY,
      AvailableThermostatMode.AUTO,
    },
    TemperatureRange? heatingRange,
    TemperatureRange? coolingRange,
  }) : super(
            device.id,
            device.displayName,
            device.description,
            device.manufacturerName,
            device.model,
            device.serialNumber,
            device.createdAt,
            device.updatedAt, [
          ThermostatTrait(<State>{
            TargetTemperature(targetTemperature),
            AmbientTemperature(ambientTemperature),
            FanMode(fanMode),
            ThermostatMode(mode),
          }, <Property>{
            AvailableFanModes(availableFanModes),
            AvailableThermostatModes(availableThermostatModes),
            HeatSetPointRange(
                heatingRange ?? TemperatureRange(min: 0.0, max: 100.0)),
            CoolSetPointRange(
                coolingRange ?? TemperatureRange(min: 0.0, max: 100.0)),
          }),
          ...device.traits.where((t) => t.runtimeType != ThermostatTrait)
        ]);

  TestThermostatDevice withFanMode(AvailableFanMode fanMode) {
    return TestThermostatDevice(this, fanMode: fanMode);
  }

  TestThermostatDevice withThermostatMode(AvailableThermostatMode mode) {
    return TestThermostatDevice(this, mode: mode);
  }

  TestThermostatDevice withTargetTemperature(double targetTemperature) {
    return TestThermostatDevice(this, targetTemperature: targetTemperature);
  }

  TestThermostatDevice withAmbientTemperature(double ambientTemperature) {
    return TestThermostatDevice(this, ambientTemperature: ambientTemperature);
  }
}
