import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/power_testing.dart';
import 'power_trait_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendPowerMethod extends Mock {
  Future<void> call(Request request, String id, bool onOff);
}

class PowerTraitProviderTest with DeviceTesting, PowerTesting {}

@GenerateMocks([GetDeviceDetailsMethod, SendPowerMethod])
void main() {
  final powerTest = PowerTraitProviderTest();
  final defaultPowerDevice =
      TestPowerDevice(powerTest.device(), supportsDiscreteOnOff: false);

  group('For PowerTraitProvider', () {
    test('Calling sendOnOff calls repository method', () async {
      Request request = Request("", {});

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, defaultPowerDevice);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      await powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verify(mockDeviceDetailsMethod(request, defaultPowerDevice.id))
          .called(greaterThan(0));
      verify(mockSendPowerMethod(request, defaultPowerDevice.id, true))
          .called(greaterThan(0));
    });

    test("""When loading device data, we are notified that it is loading
        through isLoading.""", () async {
      Request request = Request("", {});

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, defaultPowerDevice);

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      expect(powerProvider.isLoading, equals(true));
      expect(powerProvider.supportsDiscreteOnOff, isFalse);
    });

    test("""After successfully loading device data, should be in idle state
        when done.""", () async {
      Request request = Request("", {});

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(
              request, defaultPowerDevice.withSupportsDiscreteOnOff(true));

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      expect(powerProvider.isLoading, equals(false),
          reason: 'is in loading state');
      expect(powerProvider.isBusy, equals(false), reason: 'is in busy state');
      expect(powerProvider.isInErrorState, equals(false),
          reason: 'is in error state');
      expect(powerProvider.displayName, equals('name'));
      expect(powerProvider.supportsDiscreteOnOff, isTrue);
    });

    test("""When performing action, we are notified that it is performing
    action through isPerformingAction.""", () async {
      Request request = Request("", {});

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, defaultPowerDevice);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      expect(powerProvider.isPerformingAction, equals(true));
    });

    test("""When already performing action, but called action again,
        won't call action a second time""", () async {
      Request request = Request("", {});

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, defaultPowerDevice);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      expect(powerProvider.isPerformingAction, equals(true));

      powerProvider.sendPowerOnOffAction(false,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verifyNever(
          mockSendPowerMethod.call(request, defaultPowerDevice.id, false));
    });

    test("""When performing action, but state hasn't changed,
        we fetch data 10x to check if state changed.""", () async {
      Request request = Request("", {});

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          _getMockDeviceDetailsMethod(request, defaultPowerDevice);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      await powerProvider.sendPowerOnOffAction(false,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verify(mockDeviceDetailsMethod.call(request, defaultPowerDevice.id))
          .called(greaterThan(9));
    });

    test("""When an error occurs loading device data, we are notified
        an error occurred using isInErrorState and get
        an error message with getErrorMessage.""", () async {
      Request request = Request("", {});

      String exceptionMesssage = 'Throwing an exception';

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          MockGetDeviceDetailsMethod();

      when(mockDeviceDetailsMethod.call(request, defaultPowerDevice.id))
          .thenAnswer((_) async {
        throw (exceptionMesssage);
      });

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      expect(powerProvider.isInErrorState, equals(true));
      expect(powerProvider.displayName, equals('POWER'));
      expect(powerProvider.getErrorMessage, equals(exceptionMesssage));
    });

    test("""When an error occurs running an action, we are notified
        an error occurred using isInErrorState and get
        an error message with getErrorMessage.""", () async {
      Request request = Request("", {});

      String exceptionMesssage = 'Throwing an exception';

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          MockGetDeviceDetailsMethod();

      MockSendPowerMethod mockSendPowerMethod = MockSendPowerMethod();
      when(mockSendPowerMethod.call(request, defaultPowerDevice.id, true))
          .thenAnswer((_) => throw (exceptionMesssage));

      PowerTraitProvider powerProvider = PowerTraitProvider(
          request, defaultPowerDevice.id,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      await Future.delayed(Duration(milliseconds: 100));

      expect(powerProvider.isInErrorState, equals(true));
      expect(powerProvider.getErrorMessage, equals(exceptionMesssage));

      await Future.delayed(Duration(seconds: 1));
      expect(powerProvider.isInErrorState, equals(false));
    });
  });
}

MockGetDeviceDetailsMethod _getMockDeviceDetailsMethod(
    Request request, Device device) {
  MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
      MockGetDeviceDetailsMethod();

  when(mockDeviceDetailsMethod.call(request, device.id))
      .thenAnswer((_) => Future.value(device));

  return mockDeviceDetailsMethod;
}
