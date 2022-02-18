import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

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
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final mockSetModeFunction = MockSetMode();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(
              _getThermostat(23.1),
            ));
    when(mockSetModeFunction.call(any, any, any)).thenAnswer((_) async => null);
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, 'deviceId',
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.setThermostatMode('DeviceId', GThermostatMode.AUTO,
        setMode: mockSetModeFunction);

    verify(mockSetModeFunction.call(request, 'DeviceId', GThermostatMode.AUTO))
        .called(1);
  });

  test('Calling setFanMode calls repository method', () async {
    Request request = Request('', {});
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    final mockSetFanModeFunction = MockSetFanMode();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(
              _getThermostat(23.1),
            ));
    when(mockSetFanModeFunction.call(any, any, any))
        .thenAnswer((_) async => null);
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, 'deviceId',
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.setFanMode('DeviceId', AvailableFanMode.AUTO,
        setFanMode: mockSetFanModeFunction);

    verify(mockSetFanModeFunction.call(
            request, 'DeviceId', AvailableFanMode.AUTO))
        .called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request('', {});
    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();

    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(
              _getThermostat(23.1),
            ));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, 'deviceId',
        getDetails: mockGetThermostatDetailsFunction);
    await thermostatProvider.fetchData(
        getDetails: mockGetThermostatDetailsFunction);

    verify(mockGetThermostatDetailsFunction.call(request, 'deviceId'))
        .called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request('', {});

    final mockGetThermostatDetailsFunction = MockGetThermostatDetails();
    when(mockGetThermostatDetailsFunction.call(any, any))
        .thenAnswer((_) async => Future.value(
              _getThermostat(23.1),
            ));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, 'deviceId',
        getDetails: mockGetThermostatDetailsFunction);

    await thermostatProvider.fetchData(
        getDetails: mockGetThermostatDetailsFunction);

    expect(thermostatProvider.getTargetTemperatureState, 23.1);
    expect(thermostatProvider.getAmbientTemperatureState, 27.1);
    expect(thermostatProvider.displayName, 'someDisplayName');
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
        equals(TemperatureRange(min: 0, max: 100)));
    expect((thermostatProvider.getCoolTemperatureRange),
        equals(TemperatureRange(min: 0, max: 100)));
  });
}

Device _getThermostat(double temp) {
  return Device(
    'someId',
    'someDisplayName',
    'someDescription',
    'someManufacturerName',
    'someModel',
    'someFirmwareV',
    GDateTime('value'),
    GDateTime('value'),
    [
      ThermostatTrait({
        TargetTemperature(temp),
        FanMode(AvailableFanMode.AUTO),
        AmbientTemperature(temp + 4.0),
      }, {
        AvailableFanModes(
            {AvailableFanMode.AUTO, AvailableFanMode.ON, AvailableFanMode.ECO}),
        AvailableThermostatModes({
          AvailableThermostatMode.AUTO,
          AvailableThermostatMode.COOL,
          AvailableThermostatMode.HEAT
        }),
        HeatSetPointRange(TemperatureRange(min: 0, max: 100)),
        CoolSetPointRange(TemperatureRange(min: 0, max: 100)),
      })
    ],
  );
}
