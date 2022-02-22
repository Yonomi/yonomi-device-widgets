import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/thermostat_testing.dart';
import 'thermostat_provider_test.mocks.dart';

class SetPoint extends Mock {
  Future<void> call(Request request, String id, double temperature);
}

class SetMode extends Mock {
  Future<void> call(Request request, String id, GThermostatMode mode);
}

class SetFanMode extends Mock {
  Future<void> call(Request request, String id, AvailableFanMode mode);
}

class GetThermostatDetails extends Mock {
  Future<Device> call(Request request, String id);
}

final heatTemperatureRange = TemperatureRange(min: 0, max: 100);
final coolTemperatureRange = TemperatureRange(min: 0, max: 100);

@GenerateMocks([
  SetPoint,
  SetMode,
  SetFanMode,
  GetThermostatDetails,
])
void main() {
  test('Calling setPointAction calls repository method', () async {
    Request request = Request('', {});
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final mockSetPointActionFunction = MockSetPoint();
    when(mockSetPointActionFunction.call(any, any, any))
        .thenAnswer((_) async => null);
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(
              _getThermostat(23.1),
            ));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, 'deviceId',
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.setPointAction('DeviceId', 22.0,
        setPoint: mockSetPointActionFunction);

    verify(mockSetPointActionFunction.call(request, 'DeviceId', 22.0))
        .called(1);
  });

  test('Calling setThermostatMode calls repository method', () async {
    Request request = Request('', {});
    final thermostat = _getThermostat(23.1);
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final mockSetModeFunction = MockSetMode();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(thermostat));
    when(mockSetModeFunction.call(any, any, any)).thenAnswer((_) async => null);
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, thermostat.id,
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.setThermostatMode(
        thermostat.id, AvailableThermostatMode.AUTO,
        setMode: mockSetModeFunction);

    verify(mockSetModeFunction.call(
            request, thermostat.id, AvailableThermostatMode.AUTO))
        .called(1);
  });

  test('Calling setFanMode calls repository method', () async {
    Request request = Request('', {});
    final thermostat = _getThermostat(23.1);
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final mockSetFanModeFunction = MockSetFanMode();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(thermostat));
    when(mockSetFanModeFunction.call(any, any, any))
        .thenAnswer((_) async => null);
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, thermostat.id,
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.setFanMode(thermostat.id, AvailableFanMode.AUTO,
        setFanMode: mockSetFanModeFunction);

    verify(mockSetFanModeFunction.call(
            request, thermostat.id, AvailableFanMode.AUTO))
        .called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request('', {});
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final thermostat = _getThermostat(23.1);

    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(thermostat));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, thermostat.id,
        getDetails: mockGetThermostatDetailsFunction);
    await thermostatProvider.fetchData(
        getDetails: mockGetThermostatDetailsFunction);

    verify(mockGetThermostatDetailsFunction.call(request, thermostat.id))
        .called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request('', {});
    final thermostat = _getThermostat(23.1);

    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(thermostat));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, thermostat.id,
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.fetchData(
        getDetails: mockGetThermostatDetailsFunction);

    expect(thermostatProvider.getTargetTemperatureState, 23.1);
    expect(thermostatProvider.getAmbientTemperatureState, 27.1);
    expect(thermostatProvider.displayName, thermostat.displayName);
    expect(thermostatProvider.isLoading, equals(false));
    expect(thermostatProvider.isInErrorState, equals(false));
    expect(thermostatProvider.isBusy, equals(false));
    expect(thermostatProvider.isPerformingAction, equals(false));
    expect(thermostatProvider.trait<LockTrait>(), isA<UnknownTrait>());
    expect(thermostatProvider.trait<ThermostatTrait>(), isA<ThermostatTrait>());
    expect(thermostatProvider.getThermostatTrait(), isA<ThermostatTrait>());
    expect(thermostatProvider.getAvailableFanModes, hasLength(3));
    expect(thermostatProvider.getFanModeState, equals(AvailableFanMode.AUTO));
    expect(thermostatProvider.getAvailableFanModes, hasLength(3));
    expect(thermostatProvider.getAvailableThermostatModes, hasLength(3));
    expect((thermostatProvider.getHeatTemperatureRange),
        equals(heatTemperatureRange));
    expect((thermostatProvider.getCoolTemperatureRange),
        equals(coolTemperatureRange));
  });
}

class ThermostatProviderTest with DeviceTesting, ThermostatTesting {}

TestThermostatDevice _getThermostat(double temp) {
  return TestThermostatDevice(ThermostatProviderTest().device(),
      availableFanModes: {
        AvailableFanMode.AUTO,
        AvailableFanMode.ON,
        AvailableFanMode.ECO
      },
      availableThermostatModes: {
        AvailableThermostatMode.AUTO,
        AvailableThermostatMode.COOL,
        AvailableThermostatMode.HEAT
      },
      ambientTemperature: temp + 4.0,
      targetTemperature: temp);
}
