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

class GetThermostatDetails extends Mock {
  Future<Device> call(Request request, String id);
}

@GenerateMocks([
  SetPoint,
  SetMode,
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

    expect(thermostatProvider.targetTemperature, 23.1);
    expect(thermostatProvider.displayName, 'someDisplayName');
    expect(thermostatProvider.isLoading, equals(false));
    expect(thermostatProvider.isInErrorState, equals(false));
    expect(thermostatProvider.isBusy, equals(false));
    expect(thermostatProvider.isPerformingAction, equals(false));
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
    [ThermostatTrait(TargetTemperature(temp))],
  );
}
