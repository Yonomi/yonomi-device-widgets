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
  final defaultThermostatModes =
      AvailableThermostatModes(<AvailableThermostatMode>{
    AvailableThermostatMode.COOL,
    AvailableThermostatMode.HEAT,
    AvailableThermostatMode.OFF,
    AvailableThermostatMode.FANONLY,
    AvailableThermostatMode.AIRFLOW,
    AvailableThermostatMode.DEHUMIDIFY,
    AvailableThermostatMode.AUTO,
  });
  final defaultFanModes = AvailableFanModes(<AvailableFanMode>{
    AvailableFanMode.AUTO,
    AvailableFanMode.ON,
    AvailableFanMode.ECO,
    AvailableFanMode.HUMIDITY
  });
  final coolTemperatureRange = TemperatureRange(max: 100, min: 5);
  final heatTemperatureRange = TemperatureRange(max: 50, min: 10);
  final coolRange = CoolSetPointRange(coolTemperatureRange);
  final heatRange = HeatSetPointRange(heatTemperatureRange);
  final defaultProperties = <Property>{
    defaultFanModes,
    defaultThermostatModes,
    coolRange,
    heatRange
  };
  final defaultStates = <State>{
    TargetTemperature(92.0),
    AmbientTemperature(72.0),
    FanMode(AvailableFanMode.ECO),
    ThermostatMode(AvailableThermostatMode.AIRFLOW),
  };

  final stateWithHeatMode = <State>{
    TargetTemperature(92.0),
    AmbientTemperature(72.0),
    FanMode(AvailableFanMode.ECO),
    ThermostatMode(AvailableThermostatMode.HEAT),
  };

  final stateWithCoolMode = <State>{
    TargetTemperature(92.0),
    AmbientTemperature(72.0),
    FanMode(AvailableFanMode.ECO),
    ThermostatMode(AvailableThermostatMode.COOL),
  };

  final defaultDevice =
      test.device([ThermostatTrait(defaultStates, defaultProperties)]);

  final defaultDeviceWithHeatMode =
      test.device([ThermostatTrait(stateWithHeatMode, defaultProperties)]);

  final defaultDeviceWithCoolMode =
      test.device([ThermostatTrait(stateWithCoolMode, defaultProperties)]);

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
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice,
        isBusy: false,
        mode: AvailableThermostatMode.DEHUMIDIFY,
        availableThermostatModes: defaultThermostatModes.value);
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    await tester.tap(find.byKey(material.Key('defaultModeIcon-AUTO')));

    verify(mockThermostatProvider.setThermostatMode(
            defaultDevice.id, AvailableThermostatMode.AUTO))
        .called(1);
  });

  testWidgets('Tapping on fan mode icon should run setFanMode',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice,
        isBusy: false,
        fanMode: AvailableFanMode.ECO,
        availableFanModes: defaultFanModes.value);
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
    final mockThermostatProvider = test.mockThermostatProvider(defaultDevice,
        availableThermostatModes: defaultThermostatModes.value);
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
