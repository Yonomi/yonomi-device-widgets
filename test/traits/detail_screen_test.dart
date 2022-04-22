import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/providers/trait_detail_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/traits/brightness_widget.dart';
import 'package:yonomi_device_widgets/traits/color_widget.dart';
import 'package:yonomi_device_widgets/traits/detail_screen.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/brightness_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/color_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_device_widgets/traits/unknown_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../components/modes_toolbar_test.mocks.dart';
import '../mixins/brightness_testing.dart';
import '../mixins/brightness_testing.mocks.dart';
import 'detail_screen_test.mocks.dart';
import '../mixins/battery_testing.dart';
import '../mixins/color_testing.dart';
import '../mixins/device_testing.dart';
import '../mixins/lock_testing.dart';
import '../mixins/power_testing.dart';
import '../mixins/thermostat_testing.dart';

class DetailScreenTest
    with
        DeviceTesting,
        PowerTesting,
        LockTesting,
        BatteryTesting,
        ThermostatTesting,
        BrightnessTesting,
        ColorTesting {
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
        MockThermostatProvider(),
        MockBrightnessProvider(),
        MockColorProvider());
  }

  Widget createDetailScreenWidgetForTraits(
    List<Device> devices,
    Request req,
    String deviceId,
  ) {
    final device = this.device(
        traits: devices
            .map((e) => e.traits)
            .expand((element) => element)
            .toSet()
            .toList());

    TraitDetailProvider mockTraitDetailProvider = MockTraitDetailProvider();
    when(mockTraitDetailProvider.isLoading).thenReturn(false);
    when(mockTraitDetailProvider.deviceDetail).thenReturn(device);

    final batteryDevice = devices.firstWhere(
        (device) => device is TestBatteryDevice,
        orElse: () => TestBatteryDevice(device)) as TestBatteryDevice;
    BatteryLevelProvider mockBatteryTraitProvider =
        this.mockBatteryLevelProvider(batteryDevice);

    final lock = devices.firstWhere((device) => device is TestLockDevice,
        orElse: () => TestLockDevice(device,
            isLocked: false, supportsIsJammed: false)) as TestLockDevice;
    LockProvider mockLockProvider = this.mockLockProvider(lock);

    final powerDevice = devices.firstWhere(
        (device) => device is TestPowerDevice,
        orElse: () => TestPowerDevice(device,
            isOn: false, supportsDiscreteOnOff: true)) as TestPowerDevice;
    PowerTraitProvider mockPowerTraitProvider =
        this.mockPowerTraitProvider(powerDevice);

    final thermostatDevice = devices.firstWhere(
        (device) => device is TestThermostatDevice,
        orElse: () => TestThermostatDevice(device,
            targetTemperature: 90.0,
            ambientTemperature: 89.0,
            fanMode: AvailableFanMode.AUTO,
            mode: AvailableThermostatMode.AUTO)) as TestThermostatDevice;
    ThermostatProvider mockThermostatProvider =
        this.mockThermostatProvider(thermostatDevice);

    final brightnessDevice = devices.firstWhere(
            (device) => device is TestBrightnessDevice,
            orElse: () => TestBrightnessDevice(device, brightness: 100))
        as TestBrightnessDevice;
    MockBrightnessProvider mockBrightnessProvider =
        this.mockBrightnessProvider(brightnessDevice);

    final colorDevice = devices.firstWhere(
        (device) => device is TestColorDevice,
        orElse: () => TestColorDevice(device,
            colorTrait: ColorTrait(HSBColor(130, 50, 50)))) as TestColorDevice;
    final mockColorProvider = this.mockColorProvider(colorDevice);

    return createMaterialApp(
        req,
        deviceId,
        mockTraitDetailProvider,
        mockLockProvider,
        mockPowerTraitProvider,
        mockBatteryTraitProvider,
        mockThermostatProvider,
        mockBrightnessProvider,
        mockColorProvider);
  }

  MaterialApp createMaterialApp(
      Request req,
      String deviceId,
      TraitDetailProvider mockTraitBasedNotifier,
      LockProvider mockLockProvider,
      PowerTraitProvider mockPowerTraitProvider,
      BatteryLevelProvider mockBatteryLevelProvider,
      ThermostatProvider mockThermostatProvider,
      BrightnessProvider mockBrightnessProvider,
      ColorProvider mockColorProvider) {
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
            ChangeNotifierProvider<BrightnessProvider>.value(
                value: mockBrightnessProvider),
            ChangeNotifierProvider<ColorProvider>.value(
                value: mockColorProvider),
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
  ColorProvider,
  BuildContext
])
void main() {
  final test = DetailScreenTest();
  final String testedDeviceId = "";

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final materialApp = test.createDetailScreenWhenLoading(Request('', {}), "");
    await tester.pumpWidget(materialApp);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('For the Lock Trait, Detail screen should show the LockWidget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestLockDevice(test.device(id: testedDeviceId),
          isLocked: false, supportsIsJammed: false)
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
  });

  testWidgets(
      'For the Power Trait, Detail screen should show the Power Widget ',
      (WidgetTester tester) async {
    Request request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestPowerDevice(test.device(id: testedDeviceId),
          isOn: true, supportsDiscreteOnOff: true)
    ], request, testedDeviceId));

    expect(find.byType(PowerWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget ',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [TestBatteryDevice(test.device(id: testedDeviceId), batteryLevel: 90)],
        request,
        testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery low',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [TestBatteryDevice(test.device(id: testedDeviceId), batteryLevel: 1)],
        request,
        testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });

  testWidgets(
      'For the Battery Level Trait, Detail screen should show the Battery Level Widget when battery half full',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [TestBatteryDevice(test.device(id: testedDeviceId), batteryLevel: 50)],
        request,
        testedDeviceId));

    expect(find.byType(BatteryWidget), findsOneWidget);
  });


  testWidgets('For the Color Trait, Detail screen should show the Color Widget',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestColorDevice(test.device(id: testedDeviceId),
          colorTrait: ColorTrait(HSBColor(0, 0, 0)))
    ], request, testedDeviceId));

    expect(find.byType(ColorWidget), findsOneWidget);
  });


  testWidgets(
      'For the Thermostat Trait, Detail screen should show the target temperature',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestThermostatDevice(test.device(id: testedDeviceId),
          targetTemperature: 100.0, ambientTemperature: 80.0)
    ], request, testedDeviceId));

    expect(find.byType(ThermostatWidget), findsOneWidget);
    expect(find.text('100°'), findsOneWidget);
    expect(find.byType(ThermostatWidget), findsOneWidget);
    expect(find.text('80°'), findsOneWidget);
  });

  testWidgets(
      'For the Thermostat Trait, Detail screen should show the Fan Mode',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestThermostatDevice(test.device(id: testedDeviceId),
          targetTemperature: 100.0, ambientTemperature: 80.0)
    ], request, testedDeviceId));

    expect(find.byType(ThermostatWidget), findsOneWidget);
    expect(find.text('Fan: AUTO'), findsOneWidget);
  });

  testWidgets(
      'For the Brightness Trait, Detail screen should show the brightness',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [TestBrightnessDevice(test.device(id: testedDeviceId), brightness: 78)],
        request,
        testedDeviceId));

    expect(find.byIcon(BootstrapIcons.sun), findsNWidgets(2));
    expect(find.byType(BrightnessWidget), findsOneWidget);
    expect(find.text('78'), findsOneWidget);
  });

  testWidgets(
      'For any Unknown/Unsupported Trait, Detail screen should show the UnknownItemIcon widget',
      (WidgetTester tester) async {
    final request = Request('', {});
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      test.device(traits: [UnknownTrait('unknown')])
    ], request, testedDeviceId));

    expect(find.byType(UnknownItemIcon), findsOneWidget);
  });

  testWidgets(
      'For a device with multiple traits, Detail screen should show a primary trait and additional traits',
      (WidgetTester tester) async {
    final request = Request('', {});
    final device = test.device(id: testedDeviceId);
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestLockDevice(device, isLocked: false, supportsIsJammed: false),
      test.device(traits: [UnknownTrait('unknown')]),
      TestBatteryDevice(device, batteryLevel: 100),
      TestPowerDevice(device, isOn: true, supportsDiscreteOnOff: true),
      TestLockDevice(device, isLocked: false, supportsIsJammed: false),
      TestThermostatDevice(device,
          targetTemperature: 99.0, ambientTemperature: 89.0),
      TestBrightnessDevice(device, brightness: 50),
      TestColorDevice(device, colorTrait: ColorTrait(HSBColor(150, 50, 50))),
    ], request, testedDeviceId));

    expect(find.byType(LockWidget), findsOneWidget);
    expect(find.byType(UnknownItemIcon), findsOneWidget);
    expect(find.byType(BatterySlimWidget), findsOneWidget);
    expect(find.byType(LockSlimWidget), findsOneWidget);
    expect(find.byType(PowerSlimWidget), findsOneWidget);
    expect(find.byType(ThermostatSlimWidget), findsOneWidget);
    expect(find.byType(BrightnessSlimWidget), findsOneWidget);
    expect(find.byType(ColorSlimWidget), findsOneWidget);

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
    final device = test.device(id: testedDeviceId);
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestLockDevice(device, isLocked: false, supportsIsJammed: false),
      test.device(traits: [UnknownTrait('unknown')]),
      TestBatteryDevice(device, batteryLevel: 50),
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
    final device = test.device(id: testedDeviceId);
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits([
      TestLockDevice(device, isLocked: false, supportsIsJammed: false),
      test.device(traits: [UnknownTrait('unknown')]),
      TestBatteryDevice(device, batteryLevel: 1),
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
    await tester.pumpWidget(test.createDetailScreenWidgetForTraits(
        [], Request('', {}), testedDeviceId));

    final detailScreen =
        DetailScreen(request: Request('', {}), deviceId: 'deviceId');
    final multiProvider =
        detailScreen.build(MockBuildContext()) as MultiProvider;

    expect(multiProvider, isInstanceOf<MultiProvider>());
  });
}
