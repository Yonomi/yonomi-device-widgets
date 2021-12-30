import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
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

  return createMaterialApp(req, deviceId, mockTraitDetailProvider,
      MockLockProvider(), MockPowerTraitProvider(), MockBatteryLevelProvider());
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

  BatteryLevelProvider mockBatteryTraitProvider = MockBatteryLevelProvider();
  when(mockBatteryTraitProvider.isLoading).thenReturn(false);
  when(mockBatteryTraitProvider.isInErrorState).thenReturn(false);
  final batteryLevel = traits
      .firstWhere((trait) => trait is BatteryLevelTrait,
          orElse: () => BatteryLevelTrait(BatteryLevel(90)))
      .state
      .value as int;
  when(mockBatteryTraitProvider.getBatteryLevel).thenReturn(batteryLevel);
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
    BatteryLevelProvider mockBatteryLevelProvider) {
  return MaterialApp(
    home: Column(children: [
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TraitDetailProvider>.value(
              value: mockTraitBasedNotifier),
          ChangeNotifierProvider<LockProvider>.value(value: mockLockProvider),
          ChangeNotifierProvider<PowerTraitProvider>.value(
              value: mockPowerTraitProvider),
          ChangeNotifierProvider<BatteryLevelProvider>.value(
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
  BatteryLevelProvider,
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

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";

    await tester.pumpWidget(createDetailScreenWidgetForTrait([
      LockTrait(IsLocked(false)),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(100))
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);

    expect(
        tester
            .widget<Text>((find.textContaining('Battery Level: 100')))
            .style
            ?.color,
        WidgetStyleConstants.globalSuccessColor);
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits with middle battery life',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";

    await tester.pumpWidget(createDetailScreenWidgetForTrait([
      LockTrait(IsLocked(false)),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(50))
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);

    expect(
        tester
            .widget<Text>((find.textContaining('Battery Level: 50')))
            .style
            ?.color,
        Colors.white);
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits with low battery life',
      (WidgetTester tester) async {
    Request request = Request('', {});
    final String testedDeviceId = "";

    await tester.pumpWidget(createDetailScreenWidgetForTrait([
      LockTrait(IsLocked(false)),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(1))
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);

    expect(
        tester
            .widget<Text>((find.textContaining('Battery Level: 1')))
            .style
            ?.color,
        WidgetStyleConstants.globalWarningColor);
  });
  test('Detail screen returns a multiprovider', () {
    final detailScreen =
        DetailScreen(request: Request('', {}), deviceId: 'deviceId');
    expect(
        detailScreen.build(MockBuildContext()), isInstanceOf<MultiProvider>());
  });
}
