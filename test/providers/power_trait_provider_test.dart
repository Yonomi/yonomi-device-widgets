import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'power_trait_provider_test.mocks.dart';

class GetDeviceDetailsMethod extends Mock {
  Future<Device> call(Request request, String id);
}

class SendPowerMethod extends Mock {
  Future<void> call(Request request, String id, bool onOff);
}

@GenerateMocks([GetDeviceDetailsMethod, SendPowerMethod])
void main() {
  group("For PowerTraitProvider", () {
    test('Calling sendOnOff calls repository method', () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));

      verify(mockSendPowerMethod(request, deviceId, true))
          .called(greaterThan(0));
    });

    test("""When loading device data, we are notified that it is loading 
        through isLoading.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      PowerTraitProvider powerProvider = PowerTraitProvider(request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(powerProvider.isLoading, equals(true));
    });

    test("""After successfully loading device data, should be in idle state 
        when done.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      expect(powerProvider.isBusy, equals(false));
      expect(powerProvider.isInErrorState, equals(false));
    });

    test("""When performing action, we are notified that it is performing 
    action through isPerformingAction.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      expect(powerProvider.isPerformingAction, equals(true));
    });

    test("""When already performing action, but called action again, 
        won't call action a second time""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      final GetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      expect(powerProvider.isPerformingAction, equals(true));

      powerProvider.sendPowerOnOffAction(false,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verifyNever(mockSendPowerMethod.call(request, deviceId, false));
    });

    test("""When performing action, but state hasn't changed, 
        we fetch data 10x to check if state changed.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          getMockDeviceDetailsMethod(request, deviceId);

      final mockSendPowerMethod = MockSendPowerMethod();

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      verify(mockDeviceDetailsMethod.call(request, deviceId))
          .called(greaterThan(9));
    });

    test(""""When an error occurs loading device data, we are notified 
        an error occurred using isInErrorState and get 
        an error message with getErrorMessage.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      String exceptionMesssage = "Throwing an exception";

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          MockGetDeviceDetailsMethod();

      when(mockDeviceDetailsMethod.call(request, deviceId))
          .thenAnswer((_) async {
        throw (exceptionMesssage);
      });

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      await Future.delayed(Duration(milliseconds: 100));

      expect(powerProvider.isInErrorState, equals(true));
      expect(powerProvider.getErrorMessage, equals(exceptionMesssage));
    });

    test(""""When an error occurs running an action, we are notified 
        an error occurred using isInErrorState and get 
        an error message with getErrorMessage.""", () async {
      Request request = Request("", {});
      String deviceId = 'aDeviceId';

      String exceptionMesssage = "Throwing an exception";

      MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
          MockGetDeviceDetailsMethod();

      MockSendPowerMethod mockSendPowerMethod = MockSendPowerMethod();
      when(mockSendPowerMethod.call(request, deviceId, true))
          .thenAnswer((_) => throw (exceptionMesssage));

      PowerTraitProvider powerProvider = await PowerTraitProvider(
          request, deviceId,
          getDetails: mockDeviceDetailsMethod);

      powerProvider.sendPowerOnOffAction(true,
          getDetails: mockDeviceDetailsMethod,
          sendPowerMethod: mockSendPowerMethod);

      await Future.delayed(Duration(milliseconds: 100));

      expect(powerProvider.isInErrorState, equals(true));
      expect(powerProvider.getErrorMessage, equals(exceptionMesssage));
    });
  });
}

MockGetDeviceDetailsMethod getMockDeviceDetailsMethod(
    Request request, String deviceId) {
  MockGetDeviceDetailsMethod mockDeviceDetailsMethod =
      MockGetDeviceDetailsMethod();
  final device = Device(
    deviceId,
    'name',
    'description',
    'manufacturerName',
    'model',
    null,
    GDateTime('value'),
    GDateTime('value'),
    [
      PowerTrait('name', IsOnOff(false)),
    ],
  );
  when(mockDeviceDetailsMethod.call(request, deviceId))
      .thenAnswer((_) => Future.value(device));

  return mockDeviceDetailsMethod;
}
