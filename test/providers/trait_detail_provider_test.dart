import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/lock_testing.dart';
import 'trait_detail_provider_test.mocks.dart';

class GetDetails extends Mock {
  Future<Device> call(Request request, String id);
}

class TraitDetailProviderTest with DeviceTesting, LockTesting {}

@GenerateMocks([GetDetails])
void main() {
  final traitTest = TraitDetailProviderTest();

  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    final mockGetDetailsMethod = MockGetDetails();
    final device = TestLockDevice(traitTest.device(),
        isLocked: true, supportsIsJammed: false);

    when(mockGetDetailsMethod.call(request, device.id))
        .thenAnswer((_) => Future.value(device));
    TraitDetailProvider traitBasedNotifier =
        TraitDetailProvider(
        request, device.id,
        getDetails: mockGetDetailsMethod);

    await traitBasedNotifier.fetchData(getDetails: mockGetDetailsMethod);

    verify(mockGetDetailsMethod(request, device.id)).called(2);
    expect(traitBasedNotifier.deviceDetail?.displayName,
        equals(device.displayName));
    expect(traitBasedNotifier.isLoading, equals(false));
    expect(traitBasedNotifier.displayName, device.displayName);
  });
}
