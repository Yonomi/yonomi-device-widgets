import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
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
  TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
  when(mockTraitDetailProvider.isLoading).thenReturn(true);

  LockProvider mockLockProvider = MockLockProvider();

  return createMaterialApp(req, deviceId, mockTraitDetailProvider,
      mockLockProvider, MockPowerTraitProvider());
}

Widget createDetailScreenWidgetForTrait(
  Trait trait,
  Request req,
  String deviceId,
) {
  TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
  when(mockTraitDetailProvider.isLoading).thenReturn(false);
  when(mockTraitDetailProvider.deviceDetail).thenReturn(buildMockDevice(trait));

  LockProvider mockLockProvider = MockLockProvider();
  when(mockLockProvider.loadingDetail).thenReturn(false);
  when(mockLockProvider.loadingAction).thenReturn(false);
  when(mockLockProvider.isLocked).thenReturn(false);

  PowerTraitProvider mockPowerTraitProvider = MockPowerTraitProvider();
  when(mockPowerTraitProvider.isBusy).thenReturn(false);
  when(mockPowerTraitProvider.isInErrorState).thenReturn(false);
  when(mockPowerTraitProvider.getOnOffState).thenReturn(false);

  return createMaterialApp(req, deviceId, mockTraitDetailProvider,
      mockLockProvider, mockPowerTraitProvider);
}

MaterialApp createMaterialApp(
    Request req,
    String deviceId,
    TraitDetailProvider mockTraitBasedNotifier,
    LockProvider mockLockProvider,
    PowerTraitProvider mockPowerTrait) {
  return MaterialApp(
    home: Column(children: [
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TraitDetailProvider>.value(
              value: mockTraitBasedNotifier),
          ChangeNotifierProvider<LockProvider>.value(value: mockLockProvider),
          ChangeNotifierProvider<PowerTraitProvider>.value(
              value: mockPowerTrait),
        ],
        child: DetailScreenWidget(req, deviceId),
      ),
    ]),
  );
}

@GenerateMocks(
    [TraitDetailProvider, LockProvider, PowerTraitProvider, BuildContext])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    await tester.pumpWidget(createDetailScreenWhenLoading(Request('', {}), ""));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('For the Lock Trait, Detail screen should show the LockWidget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        LockTrait(IsLocked(true)), request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
  });

  testWidgets(
      'For the Power Trait, Detail screen should show the Power Widget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        PowerTrait(IsOnOff(true)), request, testedDeviceId));

    expect(find.byType(PowerWidget), findsOneWidget);
  });

  testWidgets(
      'For any Unknown/Unsupported Trait, Detail screen should show the UnknownItemIcon widget',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        UnknownTrait('unknown'), request, testedDeviceId));

    expect(find.text("unknown"), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
  });

  test('Detail screen returns a multiprovider', () {
    final detailScreen =
        DetailScreen(request: Request('', {}), deviceId: 'deviceId');
    expect(
        detailScreen.build(MockBuildContext()), isInstanceOf<MultiProvider>());
  });
}
