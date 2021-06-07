import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_platform_sdk/graphql/devices/thermostat/thermostat_queries.dart';
import 'package:yonomi_platform_sdk/repository/devices/devices_repository.dart';
import 'package:yonomi_platform_sdk/request/request.dart';

class MockSetPointActionFunction extends Mock {
  Future<void> call(Request request, String id, double temperature);
}

class MockSetModeFunction extends Mock {
  Future<void> call(Request request, String id, ThermostatMode mode);
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

    verify(mockSetPointActionFunction(any, any, 22.0)).called(1);
  });

  test('Calling setThermostatMode calls repository method', () async {
    Request request = Request("", {});
    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    MockSetModeFunction mockSetModeFunction = MockSetModeFunction();
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    await thermostatProvider.setThermostatMode("DeviceId", ThermostatMode.auto,
        injectSetModeMethod: mockSetModeFunction);

    verify(mockSetModeFunction(any, any, ThermostatMode.auto)).called(1);
  });

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    await thermostatProvider.getDeviceDetail("DeviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    verify(mockGetThermostatDetailsFunction(any, any)).called(2);
  });

  test('Device data is set using DeviceRepository\'s return values', () async {
    Request request = Request("", {});

    MockGetThermostatDetailsFunction mockGetThermostatDetailsFunction =
        MockGetThermostatDetailsFunction();
    when(mockGetThermostatDetailsFunction(any, any))
        .thenAnswer((_) => Future.value(
              Device(
                "someId",
                "someDisplayName",
                "someDescription",
                "someManufacturerName",
                "someModel",
                "someFirmwareV",
                "someSoftwareV",
                "someSerialNumber",
                DateTime.now(),
                DateTime.now(),
                [ThermostatTrait("", TargetTemperature(23.1))],
              ),
            ));
    ThermostatProvider thermostatProvider = ThermostatProvider(
        request, "deviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    await thermostatProvider.getDeviceDetail("DeviceId",
        injectGetThermostatDetailsMethod: mockGetThermostatDetailsFunction);

    expect(thermostatProvider.deviceDetail.displayName, "someDisplayName");
    expect(thermostatProvider.thermostatTargetTemperature, 23.1);
  });
}
