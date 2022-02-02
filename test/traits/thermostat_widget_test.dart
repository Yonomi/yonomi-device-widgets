import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'mixins/device_testing.dart';
import 'mixins/thermostat_widget_testing.dart';

class ThermostatWidgetTest with ThermostatWidgetTesting, DeviceTesting {}

MaterialApp createMaterialApp(ThermostatProvider mockThermostatProvider) {
  return MaterialApp(
    home: Column(children: [ThermostatWidget(mockThermostatProvider)]),
  );
}

void main() {
  final test = ThermostatWidgetTest();
  final defaultDevice = test.device([
    ThermostatTrait({TargetTemperature(92.0), FanMode('AUTO')}, {})
  ]);

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isBusy).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When thermostat widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isInErrorState).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });

  testWidgets(
      'When thermostat widget fan mode is changing, should show CircularProgressIndicator',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
    when(mockThermostatProvider.isPerformingAction).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
