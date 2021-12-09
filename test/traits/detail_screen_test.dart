import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_based_device_notifier.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'detail_screen_test.mocks.dart';

Device buildMockDevice(Trait trait) {
  var mockDevice = Device("TestedDeviceName", "", "", "", "", "",
      GDateTime('stub'), GDateTime('stub'), [trait]);
  return mockDevice;
}

Widget createDetailScreenWhenLoading(
  Request req,
  String deviceId,
) {
  TraitBasedDeviceNotifier mockTraitBasedNotifier =
      MockTraitBasedDeviceNotifier();
  when(mockTraitBasedNotifier.isLoading).thenReturn(true);

  LockProvider mockLockProvider = MockLockProvider();

  return createMaterialApp(
      mockTraitBasedNotifier, mockLockProvider, req, deviceId);
}

Widget createDetailScreenWidgetForTrait(
  Trait trait,
  Request req,
  String deviceId,
) {
  TraitBasedDeviceNotifier mockTraitBasedNotifier =
      MockTraitBasedDeviceNotifier();
  when(mockTraitBasedNotifier.isLoading).thenReturn(false);
  when(mockTraitBasedNotifier.deviceDetail).thenReturn(buildMockDevice(trait));

  LockProvider mockLockProvider = MockLockProvider();
  when(mockLockProvider.loadingDetail).thenReturn(false);
  when(mockLockProvider.loadingAction).thenReturn(false);
  when(mockLockProvider.isLocked).thenReturn(false);

  return createMaterialApp(
      mockTraitBasedNotifier, mockLockProvider, req, deviceId);
}

MaterialApp createMaterialApp(TraitBasedDeviceNotifier mockTraitBasedNotifier,
    LockProvider mockLockProvider, Request req, String deviceId) {
  return MaterialApp(
    home: Column(children: [
      MultiProvider(providers: [
        ChangeNotifierProvider<TraitBasedDeviceNotifier>.value(
            value: mockTraitBasedNotifier),
        ChangeNotifierProvider<LockProvider>.value(value: mockLockProvider),
      ], child: DetailScreenWidget(req, deviceId)),
    ]),
  );
}

@GenerateMocks([TraitBasedDeviceNotifier, LockProvider])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    await tester.pumpWidget(createDetailScreenWhenLoading(Request('', {}), ""));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('For the LockTrait, Detail screen should show the LockWidget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        LockTrait("lock", IsLocked(true)), request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
  });

  testWidgets(
      'For any Unknown/Unsupported Trait, Detail screen should show the UnknownItemIcon widget',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        UnknownTrait("unknown"), request, testedDeviceId));

    expect(find.text("unknown"), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
  });
}
