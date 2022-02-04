import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/thermostat_widget_testing.dart';

MaterialApp createMaterialApp(ThermostatProvider mockThermostatProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [ThermostatSlimWidget(mockThermostatProvider)])),
  );
}

class ThermostatWidgetTest with DeviceTesting, ThermostatWidgetTesting {}

void main() {
  final test = ThermostatWidgetTest();
  final defaultDevice = test.device([
    ThermostatTrait({TargetTemperature(90.2), FanMode(AvailableFanMode.AUTO)},
        availableFanModes: {AvailableFanMode.ON, AvailableFanMode.AUTO})
  ]);

  group("For ThermostatWidget, ", () {
    testWidgets('should display the current temperature',
        (WidgetTester tester) async {
      final mockThermostatProvider = test.mockThermostatProvider(defaultDevice);
      await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
      await tester.pumpAndSettle();
      expect(find.textContaining('90°'), findsOneWidget);
    });
  });
}
