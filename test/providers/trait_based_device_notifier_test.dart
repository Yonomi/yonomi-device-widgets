import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'trait_based_device_notifier_test.mocks.dart';

class GetDetails extends Mock {
  Future<Device> call(Request request, String id);
}

@GenerateMocks([GetDetails])
void main() {
  test('Calling getDeviceDetail calls repository method', () async {
    Request request = Request("", {});
    final mockGetDetailsMethod = MockGetDetails();
    final device = Device(
        'test',
        'name',
        'description',
        'manufacturerName',
        'model',
        null,
        GDateTime('value'),
        GDateTime('value'),
        [LockTrait('name', IsLocked(true))]);
    when(mockGetDetailsMethod.call(request, 'test'))
        .thenAnswer((_) => Future.value(device));
    TraitBasedDeviceNotifier traitBasedNotifier = TraitBasedDeviceNotifier(
        request, 'test',
        getDetails: mockGetDetailsMethod);

    await traitBasedNotifier.fetchData(getDetails: mockGetDetailsMethod);

    verify(mockGetDetailsMethod(request, 'test')).called(2);
    expect(traitBasedNotifier.deviceDetail!.displayName, equals("name"));
  });
}
