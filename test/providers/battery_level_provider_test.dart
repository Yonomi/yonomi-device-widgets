import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/battery_testing.dart';
import '../mixins/device_testing.dart';
import 'battery_level_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class BatteryLevelProviderTest with DeviceTesting, BatteryTesting {}

@GenerateMocks([GetDeviceDetailsMethod])
void main() {
  final batteryTest = BatteryLevelProviderTest();
  final testBattery =
      TestBatteryDevice(batteryTest.device(), batteryLevel: 100);
  group('For BatteryLevelProvider', () {
    test("""When loading device data, we are notified that it is loading
        through isLoading.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, deviceId, testBattery);

      BatteryLevelProvider batteryLevelProvider = BatteryLevelProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(batteryLevelProvider.displayName, 'BATTERY');
      expect(batteryLevelProvider.isLoading, equals(true));
      expect(batteryLevelProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(batteryLevelProvider.getBatteryLevelState, equals(0));
    });

    test("""After successfully loading device data, should be in idle state
        when done.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, deviceId, testBattery);

      BatteryLevelProvider batteryLevelProvider = await BatteryLevelProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(batteryLevelProvider.displayName, 'name');
      expect(batteryLevelProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(batteryLevelProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(batteryLevelProvider.getBatteryLevelState, equals(100));
      expect(batteryLevelProvider.getBatteryLevelTrait(),
          isA<BatteryLevelTrait>());
    });

    test("""When an error occurs loading device data, we are notified
        an error occurred using isInErrorState and get
        an error message with getErrorMessage.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      String exceptionMesssage = 'Throwing an exception';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, deviceId, testBattery);

      when(mockDeviceDetailsMethod.call(request, deviceId))
          .thenAnswer((_) async {
        throw (exceptionMesssage);
      });

      BatteryLevelProvider batteryLevelProvider = await BatteryLevelProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(batteryLevelProvider.isInErrorState, equals(true));
      expect(batteryLevelProvider.getErrorMessage, equals(exceptionMesssage));
      expect(batteryLevelProvider.getBatteryLevelState, equals(0));
    });
  });
}

MockGetDeviceDetailsMethod _getMockDeviceDetailsMethod(
    Request request, String deviceId, Device device) {
  MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
      MockGetDeviceDetailsMethod();
  when(mockDeviceDetailsMethod.call(request, deviceId))
      .thenAnswer((_) => Future.value(device));

  return mockDeviceDetailsMethod;
}
