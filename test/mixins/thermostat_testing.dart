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
        .thenReturn(device.coolingRange);
    when(mockThermostatProvider.getHeatTemperatureRange)
        .thenReturn(device.heatingRange);
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
  final TemperatureRange? heatingRange;
  final TemperatureRange? coolingRange;

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
    this.heatingRange,
    this.coolingRange,
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
                heatingRange ?? TemperatureRange(min: null, max: null)),
            CoolSetPointRange(
                coolingRange ?? TemperatureRange(min: null, max: null)),
          }),
          ...device.traits.where((t) => t.runtimeType != ThermostatTrait)
        ]);

  TestThermostatDevice withFanMode(AvailableFanMode fanMode) {
    return TestThermostatDevice(
      this,
      targetTemperature: this.targetTemperature,
      ambientTemperature: this.ambientTemperature,
      fanMode: fanMode,
      mode: this.mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: this.heatingRange,
      coolingRange: this.coolingRange,
    );
  }

  TestThermostatDevice withThermostatMode(AvailableThermostatMode mode) {
    return TestThermostatDevice(
      this,
      targetTemperature: this.targetTemperature,
      ambientTemperature: this.ambientTemperature,
      fanMode: this.fanMode,
      mode: mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: this.heatingRange,
      coolingRange: this.coolingRange,
    );
  }

  TestThermostatDevice withTargetTemperature(double targetTemperature) {
    return TestThermostatDevice(
      this,
      targetTemperature: targetTemperature,
      ambientTemperature: this.ambientTemperature,
      fanMode: this.fanMode,
      mode: this.mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: this.heatingRange,
      coolingRange: this.coolingRange,
    );
  }

  TestThermostatDevice withAmbientTemperature(double ambientTemperature) {
    return TestThermostatDevice(
      this,
      targetTemperature: this.targetTemperature,
      ambientTemperature: ambientTemperature,
      fanMode: this.fanMode,
      mode: this.mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: this.heatingRange,
      coolingRange: this.coolingRange,
    );
  }

  TestThermostatDevice withCoolTempRange(TemperatureRange? range) {
    return TestThermostatDevice(
      this,
      targetTemperature: this.targetTemperature,
      ambientTemperature: this.ambientTemperature,
      fanMode: this.fanMode,
      mode: this.mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: this.heatingRange,
      coolingRange: range,
    );
  }

  TestThermostatDevice withHeatingTempRange(TemperatureRange? range) {
    return TestThermostatDevice(
      this,
      targetTemperature: this.targetTemperature,
      ambientTemperature: this.ambientTemperature,
      fanMode: this.fanMode,
      mode: this.mode,
      availableFanModes: this.availableFanModes,
      availableThermostatModes: this.availableThermostatModes,
      heatingRange: range,
      coolingRange: this.coolingRange,
    );
  }
}
