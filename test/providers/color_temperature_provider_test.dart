import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/color_temperature_testing.dart';
import '../mixins/device_testing.dart';
import 'color_temperature_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SetColorTemperatureMethod extends Mock {
  Future<void> call(Request request, String id, int colorTemperature);
}

@GenerateMocks([GetDeviceDetailsMethod, SetColorTemperatureMethod])
void main() {
  final colorTemperatureProviderTest = ColorTemperatureProviderTest();

  group('For ColorTemperatureProvider', () {
    test("""After successfully loading device data, should be in idle state
        when done.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          colorTemperatureProviderTest.getMockDeviceDetailsMethod(
              request, deviceId);

      ColorTemperatureProvider colorTemperatureProvider =
          await ColorTemperatureProvider(request, deviceId,
              getDetails: mockDeviceDetailsMethod);

      expect(colorTemperatureProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(colorTemperatureProvider.isBusy, equals(false),
          reason: 'is in busy state');
      expect(colorTemperatureProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(colorTemperatureProvider.displayName, equals('name'));
      expect(colorTemperatureProvider.deviceDetail?.id, equals(deviceId));
      expect(colorTemperatureProvider.getColorTemperatureTrait(),
          isA<ColorTemperatureTrait>());
      expect(colorTemperatureProvider.getColorTemperatureState, equals(3500));
      expect(colorTemperatureProvider.getMinColorTemperature, equals(1000));
      expect(colorTemperatureProvider.getMaxColorTemperature, equals(7000));
    });

    test('Calling setBrightnessLevelAction calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          colorTemperatureProviderTest.getMockDeviceDetailsMethod(
              request, deviceId);

      final mockSetColorTemperatureMethod = MockSetColorTemperatureMethod();

      ColorTemperatureProvider colorTemperatureProvider =
          ColorTemperatureProvider(request, deviceId,
              getDetails: mockDeviceDetailsMethod);

      await colorTemperatureProvider.setColorTemperatureAction(3500,
          getDetails: mockDeviceDetailsMethod,
          setColorTemperatureFunction: mockSetColorTemperatureMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));
      verify(mockSetColorTemperatureMethod(request, deviceId, 3500))
          .called(greaterThan(0));
    });
  });
}

class ColorTemperatureProviderTest with DeviceTesting, ColorTemperatureTesting {
  MockGetDeviceDetailsMethod getMockDeviceDetailsMethod(
      Request request, String deviceId) {
    MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
        MockGetDeviceDetailsMethod();
    final device = TestColorTemperatureDevice(this.device(id: deviceId));

    when(mockDeviceDetailsMethod.call(request, deviceId))
        .thenAnswer((_) => Future.value(device));

    return mockDeviceDetailsMethod;
  }
}
