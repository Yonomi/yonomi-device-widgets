import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/pin_code_testing.dart';
import 'pin_code_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendCreatePinCodeMethod extends Mock {
  Future<void> call(
      Request request, String id, String pinCode, String pinCodeName);
}

class SendUpdatePinCodeMethod extends Mock {
  Future<void> call(
      Request request, String id, String pinCode, String pinCodeName);
}

class SendDeletePinCodeMethod extends Mock {
  Future<void> call(Request request, String id, String pinCode);
}

class PinCodeTraitProviderTest with DeviceTesting, PinCodeTesting {
  MockGetDeviceDetailsMethod getMockDeviceDetailsMethod(
      Request request, String deviceId) {
    MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
        MockGetDeviceDetailsMethod();
    final device = TestPinCodeDevice(
      this.device(id: deviceId),
      pinCodes: [
        PinCodeCredential('Admin', '5678'),
        PinCodeCredential('Plant Lady', '1234')
      ],
    );

    when(mockDeviceDetailsMethod.call(request, deviceId))
        .thenAnswer((_) => Future.value(device));

    return mockDeviceDetailsMethod;
  }
}

@GenerateMocks([
  GetDeviceDetailsMethod,
  SendCreatePinCodeMethod,
  SendUpdatePinCodeMethod,
  SendDeletePinCodeMethod
])
void main() {
  final pinCodeProviderTest = PinCodeTraitProviderTest();

  group('For PinCodeTraitProvider', () {
    test('''After successfully loading device data, should be in idle state
        when done.''', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          pinCodeProviderTest.getMockDeviceDetailsMethod(request, deviceId);

      PinCodeProvider pinCodeProvider = PinCodeProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(pinCodeProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(pinCodeProvider.isBusy, equals(false), reason: 'is in busy state');
      expect(pinCodeProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(pinCodeProvider.displayName, equals('name'));
      expect(pinCodeProvider.deviceDetail?.id, equals(deviceId));

      expect(pinCodeProvider.getPinCodeTrait(), isA<PinCodeTrait>());
      // Should have default values. See `pin_code_testing.dart`
      expect(pinCodeProvider.maxNumberOfCredentials, equals(100));
      expect(pinCodeProvider.nameLengthRange!.min, equals(1));
      expect(pinCodeProvider.nameLengthRange!.max, equals(10));
      expect(pinCodeProvider.pinCodeLengthRange!.min, equals(4));
      expect(pinCodeProvider.pinCodeLengthRange!.max, equals(50));
      expect(pinCodeProvider.getPinCodeCredentials![0].name, equals('Admin'));
      expect(pinCodeProvider.getPinCodeCredentials![0].pinCode, equals('5678'));
      expect(
          pinCodeProvider.getPinCodeCredentials![1].name, equals('Plant Lady'));
      expect(pinCodeProvider.getPinCodeCredentials![1].pinCode, equals('1234'));
    });

    test('Calling SendCreatePinCodeMethod calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          pinCodeProviderTest.getMockDeviceDetailsMethod(request, deviceId);

      final mockSendCreatePinCodeMethod = MockSendCreatePinCodeMethod();

      PinCodeProvider pinCodeProvider = PinCodeProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await pinCodeProvider.sendCreatePinCode('Admin', '5678',
          getDetails: mockDeviceDetailsMethod,
          sendCreatePinCodeMethod: mockSendCreatePinCodeMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));
      verify(mockSendCreatePinCodeMethod(request, deviceId, 'Admin', '5678'))
          .called(greaterThan(0));
    });

    test('Calling SendUpdatePinCodeMethod calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          pinCodeProviderTest.getMockDeviceDetailsMethod(request, deviceId);

      final mockSendUpdatePinCodeMethod = MockSendUpdatePinCodeMethod();

      PinCodeProvider pinCodeProvider = PinCodeProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await pinCodeProvider.sendUpdatePinCode('Admin', '5678',
          getDetails: mockDeviceDetailsMethod,
          sendUpdatePinCodeMethod: mockSendUpdatePinCodeMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));
      verify(mockSendUpdatePinCodeMethod(request, deviceId, 'Admin', '5678'))
          .called(greaterThan(0));
    });

    test('Calling SendDeletePinCodeMethod calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          pinCodeProviderTest.getMockDeviceDetailsMethod(request, deviceId);

      final mockSendDeletePinCodeMethod = MockSendDeletePinCodeMethod();

      PinCodeProvider pinCodeProvider = PinCodeProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await pinCodeProvider.sendDeletePinCode('5678', 'Admin',
          getDetails: mockDeviceDetailsMethod,
          sendDeletePinCodeMethod: mockSendDeletePinCodeMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));
      verify(mockSendDeletePinCodeMethod(request, deviceId, '5678'))
          .called(greaterThan(0));

      pinCodeProvider.dispose();
    });
  });
}
