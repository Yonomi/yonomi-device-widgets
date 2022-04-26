import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/color_temperature_icon.dart';
import 'package:yonomi_device_widgets/assets/traits/device_item_icon.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

Widget createIconWidget(List<Trait> traits) {
  return MaterialApp(
    home: Scaffold(
      body: Container(child: DeviceItemIcon.getIcon(traits)),
    ),
  );
}

void main() {
  final availableFanModes = AvailableFanModes(
      {AvailableFanMode.AUTO, AvailableFanMode.ON, AvailableFanMode.ECO});

  testWidgets('should render correct thermostat trait icon',
      (WidgetTester tester) async {
    final thermostatDevice = [
      ThermostatTrait({TargetTemperature(22)}, {availableFanModes})
    ];
    await tester.pumpWidget(createIconWidget(thermostatDevice));
    expect(find.widgetWithText(Center, '22'), findsOneWidget);
  });

  testWidgets('should render n/a if target temperature is null',
      (WidgetTester tester) async {
    final thermostatDevice = [
      ThermostatTrait({TargetTemperature(null)}, {availableFanModes})
    ];
    await tester.pumpWidget(createIconWidget(thermostatDevice));
    expect(find.widgetWithText(Center, 'N/A'), findsOneWidget);
  });

  testWidgets('should render correct Lock trait icon when unlocked',
      (WidgetTester tester) async {
    final lockDevice = [
      LockTrait({IsLocked(false)}, {SupportsIsJammed(false)})
    ];
    await tester.pumpWidget(createIconWidget(lockDevice));
    expect(find.byIcon(BootstrapIcons.unlock), findsOneWidget);
  });

  testWidgets('should render correct Lock trait icon when locked',
      (WidgetTester tester) async {
    final lockDevice = [
      LockTrait({IsLocked(true)}, {SupportsIsJammed(false)})
    ];
    await tester.pumpWidget(createIconWidget(lockDevice));
    expect(find.byIcon(BootstrapIcons.lock), findsOneWidget);
  });

  testWidgets('should render Unknown icon when state is not IsLocked',
      (WidgetTester tester) async {
    final lockDevice = [
      LockTrait({UnknownState()}, {SupportsIsJammed(false)})
    ];
    await tester.pumpWidget(createIconWidget(lockDevice));
    expect(find.byIcon(BootstrapIcons.box), findsOneWidget);
  });

  testWidgets('should render correct Power trait icon',
      (WidgetTester tester) async {
    final powerDevice = [
      PowerTrait(IsOnOff(true),
          supportsDiscreteOnOff: SupportsDiscreteOnOff(true))
    ];
    await tester.pumpWidget(createIconWidget(powerDevice));
    expect(find.byIcon(BootstrapIcons.power), findsOneWidget);
  });

  testWidgets('should render full Battery trait icon',
      (WidgetTester tester) async {
    final batteryLevelDevice = [BatteryLevelTrait(BatteryLevel(100))];
    await tester.pumpWidget(createIconWidget(batteryLevelDevice));
    expect(find.byIcon(BootstrapIcons.battery_full), findsOneWidget);
  });

  testWidgets('should render half Battery trait icon',
      (WidgetTester tester) async {
    final batteryLevelDevice = [BatteryLevelTrait(BatteryLevel(50))];
    await tester.pumpWidget(createIconWidget(batteryLevelDevice));
    expect(find.byIcon(BootstrapIcons.battery_half), findsOneWidget);
  });

  testWidgets('should render empty Battery trait icon',
      (WidgetTester tester) async {
    final batteryLevelDevice = [BatteryLevelTrait(BatteryLevel(0))];
    await tester.pumpWidget(createIconWidget(batteryLevelDevice));
    expect(find.byIcon(BootstrapIcons.battery), findsOneWidget);
  });

  testWidgets('should render correct ColorTemperature trait icon',
      (WidgetTester tester) async {
    final colorTemperatureDevice = [
      ColorTemperatureTrait({ColorTemperature(3500)}, {})
    ];
    await tester.pumpWidget(createIconWidget(colorTemperatureDevice));
    expect(find.byIcon(ColorTemperatureIcon.DEFAULT_ICON), findsOneWidget);
  });

  testWidgets('should render unknown icon if trait not found',
      (WidgetTester tester) async {
    final unknownDevice = [UnknownTrait('unknown')];
    await tester.pumpWidget(createIconWidget(unknownDevice));
    expect(find.byIcon(BootstrapIcons.box), findsOneWidget);
  });
}
