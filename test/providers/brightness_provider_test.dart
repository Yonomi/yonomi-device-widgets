import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/brightness_testing.dart';
import '../mixins/device_testing.dart';
import 'brightness_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendBrightnessMethod extends Mock {
  Future<void> call(Request request, String id, int brightness);
}

@GenerateMocks([GetDeviceDetailsMethod, SendBrightnessMethod])
void main() {
  final brightnessTest = BrightnessProviderTest();

  group('For BrightnessProvider', () {
    test("""After successfully loading device data, should be in idle state
        when done.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          brightnessTest.getMockDeviceDetailsMethod(request, deviceId);

      final brightnessProvider = await BrightnessProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(brightnessProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(brightnessProvider.isBusy, equals(false),
          reason: 'is in busy state');
      expect(brightnessProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(brightnessProvider.displayName, equals('name'));
      expect(brightnessProvider.deviceDetail?.id, equals(deviceId));
      expect(brightnessProvider.getBrightnessTrait(), isA<BrightnessTrait>());
      expect(brightnessProvider.getBrightnessState, equals(80));
    });

    test('Calling setBrightnessLevelAction calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          brightnessTest.getMockDeviceDetailsMethod(request, deviceId);

      final mockBrightnessMethod = MockSendBrightnessMethod();

      BrightnessProvider brightnessProvider = BrightnessProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await brightnessProvider.setBrightnessLevelAction(10,
          getDetails: mockDeviceDetailsMethod,
          sendBrightnessLevel: mockBrightnessMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));
      verify(mockBrightnessMethod(request, deviceId, 10))
          .called(greaterThan(0));
    });
  });
}

class BrightnessProviderTest with DeviceTesting, BrightnessTesting {
  BrightnessProviderTest();

  MockGetDeviceDetailsMethod getMockDeviceDetailsMethod(
      Request request, String deviceId) {
    MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
        MockGetDeviceDetailsMethod();
    final device = TestBrightnessDevice(this.device(id: deviceId));

    when(mockDeviceDetailsMethod.call(request, deviceId))
        .thenAnswer((_) => Future.value(device));

    return mockDeviceDetailsMethod;
  }
}
