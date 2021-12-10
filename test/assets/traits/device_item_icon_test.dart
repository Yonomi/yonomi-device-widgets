import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:yonomi_device_widgets/assets/traits/device_item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

Widget createIconWidget(List<Trait> traits) {
  return MaterialApp(
    home: Scaffold(
      body: Container(child: DeviceItemIcon.getIcon(traits)),
    ),
  );
}

void main() {
  testWidgets('should render correct thermostat trait icon',
      (WidgetTester tester) async {
    final thermostatDevice = [
      ThermostatTrait('thermostat', TargetTemperature(22))
    ];
    await tester.pumpWidget(createIconWidget(thermostatDevice));
    expect(find.widgetWithText(Center, '22'), findsOneWidget);
  });

  testWidgets('should render n/a if target temperature is null',
      (WidgetTester tester) async {
    final thermostatDevice = [
      ThermostatTrait('thermostat', TargetTemperature(null))
    ];
    await tester.pumpWidget(createIconWidget(thermostatDevice));
    expect(find.widgetWithText(Center, 'N/A'), findsOneWidget);
  });

  testWidgets('should render correct Lock trait icon when unlocked',
      (WidgetTester tester) async {
    final lockDevice = [
      LockTrait('lockunlock', IsLocked(false))
    ];
    await tester.pumpWidget(createIconWidget(lockDevice));
    expect(find.byIcon(BootstrapIcons.unlock), findsOneWidget);
  });

  testWidgets('should render correct Lock trait icon when locked',
      (WidgetTester tester) async {
    final lockDevice = [
      LockTrait('lockunlock', IsLocked(true))
    ];
    await tester.pumpWidget(createIconWidget(lockDevice));
    expect(find.byIcon(BootstrapIcons.lock), findsOneWidget);
  });

  testWidgets('should render unknown icon if trait not found',
      (WidgetTester tester) async {
    final unknownDevice = [UnknownTrait('unknown')];
    await tester.pumpWidget(createIconWidget(unknownDevice));
    expect(find.byIcon(BootstrapIcons.box), findsOneWidget);
  });
}
