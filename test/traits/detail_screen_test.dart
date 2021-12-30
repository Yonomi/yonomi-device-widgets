import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'detail_screen_test.mocks.dart';

Device buildMockDevice(List<Trait> traits) {
  var mockDevice = Device("TestedDeviceName", "", "", "", "", "",
      GDateTime('stub'), GDateTime('stub'), traits);
  return mockDevice;
}

Widget createDetailScreenWhenLoading(
  Request req,
  String deviceId,
) {
  TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
  when(mockTraitDetailProvider.isLoading).thenReturn(true);

  return createMaterialApp(
      req,
      deviceId,
      mockTraitDetailProvider,
      MockLockProvider(),
      MockPowerTraitProvider(),
      MockBatteryLevelTraitProvider());
}

Widget createDetailScreenWidgetForTrait(
  List<Trait> traits,
  Request req,
  String deviceId,
) {
  TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
  when(mockTraitDetailProvider.isLoading).thenReturn(false);
  when(mockTraitDetailProvider.deviceDetail)
      .thenReturn(buildMockDevice(traits));

  LockProvider mockLockProvider = MockLockProvider();
  when(mockLockProvider.loadingDetail).thenReturn(false);
  when(mockLockProvider.loadingAction).thenReturn(false);
  when(mockLockProvider.isLocked).thenReturn(false);

  PowerTraitProvider mockPowerTraitProvider = MockPowerTraitProvider();
  when(mockPowerTraitProvider.isBusy).thenReturn(false);
  when(mockPowerTraitProvider.isInErrorState).thenReturn(false);
  when(mockPowerTraitProvider.getOnOffState).thenReturn(false);

  BatteryLevelTraitProvider mockBatteryTraitProvider =
      MockBatteryLevelTraitProvider();
  when(mockBatteryTraitProvider.isLoading).thenReturn(false);
  when(mockBatteryTraitProvider.isInErrorState).thenReturn(false);
  when(mockBatteryTraitProvider.getBatteryLevel).thenReturn(90);
  when(mockBatteryTraitProvider.displayName).thenReturn('BATTERY');

  return createMaterialApp(req, deviceId, mockTraitDetailProvider,
      mockLockProvider, mockPowerTraitProvider, mockBatteryTraitProvider);
}

MaterialApp createMaterialApp(
    Request req,
    String deviceId,
    TraitDetailProvider mockTraitBasedNotifier,
    LockProvider mockLockProvider,
    PowerTraitProvider mockPowerTraitProvider,
    BatteryLevelTraitProvider mockBatteryLevelProvider) {
  return MaterialApp(
    home: Column(children: [
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TraitDetailProvider>.value(
              value: mockTraitBasedNotifier),
          ChangeNotifierProvider<LockProvider>.value(value: mockLockProvider),
          ChangeNotifierProvider<PowerTraitProvider>.value(
              value: mockPowerTraitProvider),
          ChangeNotifierProvider<BatteryLevelTraitProvider>.value(
              value: mockBatteryLevelProvider),
        ],
        child: DetailScreenWidget(req, deviceId),
      ),
    ]),
  );
}

@GenerateMocks([
  TraitDetailProvider,
  LockProvider,
  PowerTraitProvider,
  BatteryLevelTraitProvider,
  BuildContext
])
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
        [LockTrait(IsLocked(true))], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
  });

  testWidgets(
      'For the Power Trait, Detail screen should show the Power Widget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        [PowerTrait(IsOnOff(true))], request, testedDeviceId));

    expect(find.byType(PowerWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        [BatteryLevelTrait(BatteryLevel(90))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery low',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        [BatteryLevelTrait(BatteryLevel(1))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery half full',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        [BatteryLevelTrait(BatteryLevel(50))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For any Unknown/Unsupported Trait, Detail screen should show the UnknownItemIcon widget',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";
    await tester.pumpWidget(createDetailScreenWidgetForTrait(
        [UnknownTrait('unknown')], request, testedDeviceId));

    expect(find.byType(UnknownItemIcon), findsOneWidget);
  });

  test('Detail screen returns a multiprovider', () {
    final detailScreen =
        DetailScreen(request: Request('', {}), deviceId: 'deviceId');
    expect(
        detailScreen.build(MockBuildContext()), isInstanceOf<MultiProvider>());
  });
}
