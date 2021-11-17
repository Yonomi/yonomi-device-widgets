import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class MockSetPointActionFunction extends Mock {
  Future<void> call(Request request, String id, double temperature);
}

class MockSetModeFunction extends Mock {
  Future<void> call(Request request, String id, GThermostatMode mode);
}

class MockGetThermostatDetailsFunction extends Mock {
  Future<Device> call(Request request, String id);
}

void main() {
  test('Calling setPointAction calls repository method', () async {
    Request request = Request("", {});
    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    MockSetPointActionFunction mockSetPointActionFunction =
        MockSetPointActionFunction();
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    await thermostatProvider.setPointAction("DeviceId", 22.0,
        injectSetPointThermostatMethod: mockSetPointActionFunction);

    verify(mockSetPointActionFunction(request, "someDeviceId", 22.0)).called(1);
  });

  test('Calling setThermostatMode calls repository method', () async {
    Request request = Request("", {});
    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    MockSetModeFunction mockSetModeFunction = MockSetModeFunction();
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction
            as Future<Device> Function(Request?, String)?);

    await thermostatProvider.setThermostatMode("DeviceId", GThermostatMode.AUTO,
        injectSetModeMethod: mockSetModeFunction);

    verify(mockSetModeFunction(request, "someDeviceId", GThermostatMode.AUTO))
        .called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction
            as Future<Device> Function(Request?, String)?);

    await thermostatProvider.getDeviceDetail("DeviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction
            as Future<Device> Function(Request?, String)?);

    verify(mockGetThermostatDetailsFunction(request, "someDeviceId")).called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    when(mockGetThermostatDetailsFunction(request, "someDeviceId"))
        .thenAnswer((_) async => Future.value(
              Device(
                "someId",
                "someDisplayName",
                "someDescription",
                "someManufacturerName",
                "someModel",
                "someFirmwareV",
                GDateTime(),
                GDateTime(),
                [ThermostatTrait("", TargetTemperature(23.1))],
              ),
            ));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    await thermostatProvider.getDeviceDetail("DeviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    expect(thermostatProvider.deviceDetail?.displayName, "someDisplayName");
    expect(thermostatProvider.thermostatTargetTemperature, 23.1);
  });
}
