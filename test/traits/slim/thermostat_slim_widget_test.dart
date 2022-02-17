import 'package:flutter/material.dart' as material;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/thermostat_slim_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/thermostat_widget_testing.dart';

material.MaterialApp createMaterialApp(
    ThermostatProvider mockThermostatProvider) {
  return material.MaterialApp(
    home: material.Scaffold(
        body: material.Column(children: [
      material.Expanded(child: ThermostatSlimWidget(mockThermostatProvider))
    ])),
  );
}

class ThermostatWidgetTest with DeviceTesting, ThermostatWidgetTesting {}

void main() {
  final test = ThermostatWidgetTest();
  final defaultDevice = TestThermostatDevice(test.device());

  group("For ThermostatSlimWidget, ", () {
    testWidgets('should display the current temperature',
        (WidgetTester tester) async {
      final mockThermostatProvider = test
          .mockThermostatProvider(defaultDevice.withTargetTemperature(90.0));
      await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
      await tester.pumpAndSettle();
      expect(find.textContaining('90°'), findsOneWidget);
    });

    testWidgets('Tapping on fan mode icon should run setFanMode',
        (WidgetTester tester) async {
      final mockThermostatProvider = test.mockThermostatProvider(
        defaultDevice.withFanMode(AvailableFanMode.ECO),
        isBusy: false,
      );
      await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

      await tester.tap(find.byType(material.ExpansionTile));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(material.Key('fanModeChip-AUTO')));

      verify(mockThermostatProvider.setFanMode(
              defaultDevice.id, AvailableFanMode.AUTO))
          .called(1);
    });

    testWidgets('Tapping on mode icon should run setThermostatMode',
        (WidgetTester tester) async {
      final mockThermostatProvider = test.mockThermostatProvider(
          defaultDevice.withThermostatMode(AvailableThermostatMode.DEHUMIDIFY),
          isBusy: false);
      await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

      await tester.tap(find.byType(material.ExpansionTile));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(material.Key('modeChip-AUTO')));

      verify(mockThermostatProvider.setThermostatMode(
              defaultDevice.id, AvailableThermostatMode.AUTO))
          .called(1);
    });
  });
}
