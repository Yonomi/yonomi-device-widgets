import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_device_widgets/traits/unknown_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../components/modes_toolbar_test.mocks.dart';
import 'detail_screen_test.mocks.dart';
import 'mixins/battery_widget_testing.dart';
import 'mixins/device_testing.dart';
import 'mixins/lock_widget_testing.dart';
import 'mixins/power_widget_testing.dart';
import 'mixins/thermostat_widget_testing.dart';

class DetailScreenTest
    with
        DeviceTesting,
        PowerWidgetTesting,
        LockWidgetTesting,
        BatteryWidgetTesting,
        ThermostatWidgetTesting {
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
        MockBatteryLevelProvider(),
        MockThermostatProvider());
  }

  Widget createDetailScreenWidgetForTraits(
    List<Trait> traits,
    Request req,
    String deviceId,
  ) {
    TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
    when(mockTraitDetailProvider.isLoading).thenReturn(false);
    when(mockTraitDetailProvider.deviceDetail).thenReturn(device(traits));

    final lock = device([
      traits.firstWhere((trait) => trait is LockTrait,
          orElse: () => LockTrait(IsLocked(false), {}))
    ]);
    LockProvider mockLockProvider =
        this.mockLockProvider(lock, isLocked: false);

    final powerDevice = device([
      traits.firstWhere((trait) => trait is PowerTrait,
          orElse: () => PowerTrait(IsOnOff(false), {}))
    ]);
    PowerTraitProvider mockPowerTraitProvider =
        this.mockPowerTraitProvider(powerDevice, onOffState: false);

    final batteryLevelTrait = traits.firstWhere(
        (trait) => trait is BatteryLevelTrait,
        orElse: () => BatteryLevelTrait(BatteryLevel(90)));
    final batteryDevice = device([batteryLevelTrait], name: 'BATTERY');
    BatteryLevelProvider mockBatteryTraitProvider = this
        .mockBatteryLevelProvider(batteryDevice,
            batteryLevel:
                batteryLevelTrait.states.whereType<BatteryLevel>().first.value);

    final thermostatTraits = traits.whereType<ThermostatTrait>().toList();
    final thermostatDevice = device(thermostatTraits, name: 'THERMOSTAT');
    ThermostatProvider mockThermostatProvider =
        this.mockThermostatProvider(thermostatDevice);
    return createMaterialApp(
        req,
        deviceId,
        mockTraitDetailProvider,
        mockLockProvider,
        mockPowerTraitProvider,
        mockBatteryTraitProvider,
        mockThermostatProvider);
  }

  MaterialApp createMaterialApp(
      Request req,
      String deviceId,
      TraitDetailProvider mockTraitBasedNotifier,
      LockProvider mockLockProvider,
      PowerTraitProvider mockPowerTraitProvider,
      BatteryLevelProvider mockBatteryLevelProvider,
      ThermostatProvider mockThermostatProvider) {
    return MaterialApp(
      home: SingleChildScrollView(
          child: Column(children: [
        MultiProvider(
          providers: [
            ChangeNotifierProvider<TraitDetailProvider>.value(
                value: mockTraitBasedNotifier),
            ChangeNotifierProvider<LockProvider>.value(value: mockLockProvider),
            ChangeNotifierProvider<PowerTraitProvider>.value(
                value: mockPowerTraitProvider),
            ChangeNotifierProvider<BatteryLevelProvider>.value(
                value: mockBatteryLevelProvider),
            ChangeNotifierProvider<ThermostatProvider>.value(
                value: mockThermostatProvider),
          ],
          child: DetailScreenWidget(req, deviceId),
        ),
      ])),
    );
  }
}

@GenerateMocks([
  TraitDetailProvider,
  LockProvider,
  PowerTraitProvider,
  BatteryLevelProvider,
  BuildContext
])
void main() {
  final test = DetailScreenTest();
  final String testedDeviceId = "";

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(test.createDetailScreenWhenLoading(Request('', {}), ""));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('For the Lock Trait, Detail screen should show the LockWidget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [LockTrait(IsLocked(true), {})], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
  });

  testWidgets(
      'For the Power Trait, Detail screen should show the Power Widget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [PowerTrait(IsOnOff(true), {})], request, testedDeviceId));

    expect(find.byType(PowerWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget ',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [BatteryLevelTrait(BatteryLevel(90))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery low',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [BatteryLevelTrait(BatteryLevel(1))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery half full',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [BatteryLevelTrait(BatteryLevel(50))], request, testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Thermostat Trait, Detail screen should show the target temperature',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      ThermostatTrait({TargetTemperature(100.0)})
    ], request, testedDeviceId));

    expect(find.byType(ThermostatWidget), findsOneWidget);
    expect(find.text('100°'), findsOneWidget);
  });

  testWidgets(
      'For any Unknown/Unsupported Trait, Detail screen should show the UnknownItemIcon widget',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [UnknownTrait('unknown')], request, testedDeviceId));

    expect(find.byType(UnknownItemIcon), findsOneWidget);
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits',
      (WidgetTester tester) async {
    final request = Request('', {});

    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      LockTrait(IsLocked(false), {}),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(100)),
      PowerTrait(IsOnOff(true), {}),
      LockTrait(IsLocked(false), {}),
      ThermostatTrait({TargetTemperature(99)})
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatterySlimWidget), findsOneWidget);
    expect(find.byType(LockSlimWidget), findsOneWidget);
    expect(find.byType(PowerSlimWidget), findsOneWidget);
    expect(find.byType(ThermostatSlimWidget), findsOneWidget);

    expect(find.byType(MultiProvider), findsOneWidget);

    final batteryWidget =
        tester.widget<BatterySlimWidget>(find.byType(BatterySlimWidget));
    expect(batteryWidget.headerText.data, contains('Battery Level: 100%'));
    expect(batteryWidget.headerText.style?.color,
        WidgetStyleConstants.globalSuccessColor);

    final thermostatWidget =
        tester.widget<ThermostatSlimWidget>(find.byType(ThermostatSlimWidget));
    expect(
        thermostatWidget.headerText.data, contains('Target Temperature: 99°'));
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits with middle battery life',
      (WidgetTester tester) async {
    final request = Request('', {});

    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      LockTrait(IsLocked(false), {}),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(50))
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatterySlimWidget), findsOneWidget);

    final batteryWidget =
        tester.widget<BatterySlimWidget>(find.byType(BatterySlimWidget));
    expect(batteryWidget.headerText.data, contains('Battery Level: 50%'));
    expect(batteryWidget.headerText.style?.color,
        WidgetStyleConstants.darkTextColor);
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits with low battery life',
      (WidgetTester tester) async {
    final request = Request('', {});

    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      LockTrait(IsLocked(false), {}),
      UnknownTrait('unknown'),
      BatteryLevelTrait(BatteryLevel(1))
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatterySlimWidget), findsOneWidget);

    final batteryWidget =
        tester.widget<BatterySlimWidget>(find.byType(BatterySlimWidget));
    expect(batteryWidget.headerText.data, contains('Battery Level: 1'));
    expect(batteryWidget.headerText.style?.color,
        WidgetStyleConstants.globalWarningColor);
  });

  testWidgets(
      'For a device with no traits, Detail screen should show an unknown trait display',
      (WidgetTester tester) async {
    final request = Request('', {});

    await tester.pumpWidget(
        test.createDetailScreenWidgetForTraits([], request, testedDeviceId));

    expect(find.byType(UnknownWidget), findsOneWidget);
  });

  testWidgets('Detail screen returns a multiprovider',
      (WidgetTester tester) async {
    final detailScreen =
        DetailScreen(request: Request('', {}), deviceId: 'deviceId');
    expect(
        detailScreen.build(MockBuildContext()), isInstanceOf<MultiProvider>());
  });
}
