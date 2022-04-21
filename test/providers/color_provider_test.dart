import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/color_testing.dart';
import '../mixins/device_testing.dart';
import 'color_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendSetColorActionMethod extends Mock {
  Future<void> call(Request request, String id, HSBColor hsbColor);
}

@GenerateMocks([GetDeviceDetailsMethod, SendSetColorActionMethod])
void main() {
  final colorTest = ColorProviderTest();
  final defaultColorDevice = TestColorDevice(
      colorTest
          .device(id: 'aDeviceId', traits: [ColorTrait(HSBColor(130, 50, 50))]),
      colorTrait: ColorTrait(HSBColor(130, 50, 50)));
  ;

  group('For ColorProvider', () {
    test("""After successfully loading device data, should be in idle state
        when done.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          colorTest.getMockDeviceDetailsMethod(request, deviceId);

      final colorProvider = await ColorProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(colorProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(colorProvider.isBusy, equals(false), reason: 'is in busy state');
      expect(colorProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(colorProvider.displayName, defaultColorDevice.displayName);
      expect(colorProvider.deviceDetail?.id, equals(deviceId));
      expect(colorProvider.getColorTrait, isA<ColorTrait>());
      expect(colorProvider.getColorState, isA<GHSBColorValueInput>());
    });

  });
}

class ColorProviderTest with DeviceTesting, ColorTesting {
  MockGetDeviceDetailsMethod getMockDeviceDetailsMethod(
      Request request, String deviceId) {
    MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
        MockGetDeviceDetailsMethod();

    final device = TestColorDevice(
        this.device(id: deviceId, traits: [ColorTrait(HSBColor(130, 50, 50))]),
        colorTrait: ColorTrait(HSBColor(130, 50, 50)));

    when(mockDeviceDetailsMethod.call(request, deviceId))
        .thenAnswer((_) => Future.value(device));

    return mockDeviceDetailsMethod;
  }
}
