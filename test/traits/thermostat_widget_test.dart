import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'mixins/device_testing.dart';
import 'mixins/thermostat_widget_testing.dart';

class ThermostatWidgetTest with ThermostatWidgetTesting, DeviceTesting {}

material.MaterialApp createMaterialApp(
    ThermostatProvider mockThermostatProvider) {
  return material.MaterialApp(
    home: material.Scaffold(
        body: material.Column(
            children: [ThermostatWidget(mockThermostatProvider)])),
  );
}

void main() {
  final test = ThermostatWidgetTest();
  final defaultDevice = TestThermostat(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isBusy).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byType(material.CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When thermostat widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isInErrorState).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byIcon(material.Icons.error), findsOneWidget);
  });

  testWidgets(
      'When thermostat widget fan mode is changing, should show CircularProgressIndicator',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isPerformingAction).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byType(material.CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Tapping on mode icon should run setThermostatMode',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice.withThermostatMode(AvailableThermostatMode.DEHUMIDIFY),
      isBusy: false,
    );
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    await tester.tap(find.byKey(material.Key('defaultModeIcon-AUTO')));

    verify(mockThermostatProvider.setThermostatMode(
            defaultDevice.id, AvailableThermostatMode.AUTO))
        .called(1);
  });

  testWidgets('Tapping on fan mode icon should run setFanMode',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(
        defaultDevice.withFanMode(AvailableFanMode.ECO),
        isBusy: false);
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    await tester.tap(find.byType(material.ExpansionTile));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(material.Key('fanModeChip-AUTO')));

    verify(mockThermostatProvider.setFanMode(
            defaultDevice.id, AvailableFanMode.AUTO))
        .called(1);
  });

  testWidgets('Thermostat widget shows correct icons in mode bar',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isBusy).thenReturn(false);
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byKey(material.Key('defaultModeIcon-AUTO')), findsOneWidget,
        reason: 'AUTO icon');
    expect(find.byIcon(material.Icons.ac_unit), findsOneWidget,
        reason: 'COOL icon');
    expect(find.byIcon(BootstrapIcons.power), findsOneWidget,
        reason: 'OFF icon');
    expect(find.byIcon(BootstrapIcons.fan),
        findsNWidgets(2), // There is a fan in the fan mode description
        reason: 'FANONLY icon');
    expect(find.byIcon(material.Icons.air), findsOneWidget,
        reason: 'AIRFLOW icon');
    expect(find.byIcon(material.Icons.whatshot), findsOneWidget,
        reason: 'HEAT icon');
  });
}
