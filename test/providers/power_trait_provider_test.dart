import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/trait_based_device_screen.dart';
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
  test('Calling sendOnOff calls repository method', () async {
    String deviceId = 'aDeviceId';
    Request request = Request("", {});
    final mockDeviceDetailsMethod = MockGetDeviceDetailsMethod();
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
        PowerTrait('name', UnknownState()),
      ],
    );
    when(mockDeviceDetailsMethod.call(request, deviceId))
        .thenAnswer((_) => Future.value(device));
    final mockSendPowerMethod = MockSendPowerMethod();
    PowerTraitProvider powerProvider = await PowerTraitProvider(
        request, deviceId,
        getDetails: mockDeviceDetailsMethod);

    await powerProvider.sendPowerOnOffAction(true,
        getDetails: mockDeviceDetailsMethod,
        sendPowerMethod: mockSendPowerMethod);

    verify(mockDeviceDetailsMethod(request, deviceId)).called(greaterThan(0));

    verify(mockSendPowerMethod(request, deviceId, true)).called(greaterThan(0));
  });
}
