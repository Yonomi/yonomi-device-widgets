import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/traits/thermostat_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/device_testing.dart';
import '../mixins/thermostat_testing.dart';

class ThermostatWidgetTest with ThermostatTesting, DeviceTesting {}

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
  final defaultDevice = TestThermostatDevice(test.device());

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

  testWidgets('Cool Mode should display slider', (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice.withThermostatMode(AvailableThermostatMode.COOL),
      isBusy: false,
    );
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));

    expect(find.byType(TemperatureRangeSlider), findsOneWidget);
  });

  testWidgets('Heat Mode should display slider', (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice.withThermostatMode(AvailableThermostatMode.HEAT),
      isBusy: false,
    );
    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
    final slider = find.byType(TemperatureRangeSlider);

    expect(slider, findsOneWidget);
  });

  testWidgets('Cool Mode slider value should be min if value is less than min',
      (WidgetTester tester) async {
    final expectedMin = 20.0;
    final expectedMax = 30.0;

    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice
          .withThermostatMode(AvailableThermostatMode.COOL)
          .withTargetTemperature(10)
          .withCoolTempRange(
              TemperatureRange(min: expectedMin, max: expectedMax)),
    );

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
    final slider = find.byKey(Key('thermostat_cool_slider'));
    expect(slider, findsOneWidget);
    expect(
        (slider.evaluate().first.widget as TemperatureRangeSlider).sliderValue,
        equals(expectedMin));
  });

  testWidgets('Heat Mode slider value should be min if value is less than min',
      (WidgetTester tester) async {
    final expectedMin = 20.0;
    final expectedMax = 30.0;

    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice
          .withThermostatMode(AvailableThermostatMode.HEAT)
          .withTargetTemperature(10)
          .withHeatingTempRange(
              TemperatureRange(min: expectedMin, max: expectedMax)),
    );

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
    final slider = find.byKey(Key('thermostat_hot_slider'));
    expect(slider, findsOneWidget);
    expect(
        (slider.evaluate().first.widget as TemperatureRangeSlider).sliderValue,
        equals(expectedMin));
  });

  testWidgets('Heat Mode slider value should be max if value is more than max',
      (WidgetTester tester) async {
    final expectedMin = 20.0;
    final expectedMax = 30.0;

    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice
          .withThermostatMode(AvailableThermostatMode.HEAT)
          .withTargetTemperature(40)
          .withHeatingTempRange(
              TemperatureRange(min: expectedMin, max: expectedMax)),
    );

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
    final slider = find.byKey(Key('thermostat_hot_slider'));
    expect(slider, findsOneWidget);
    expect(
        (slider.evaluate().first.widget as TemperatureRangeSlider).sliderValue,
        equals(expectedMax));
  });

  testWidgets('temperature slider should slide value',
      (WidgetTester tester) async {
    final mockThermostatProvider = test.mockThermostatProvider(
      defaultDevice.withThermostatMode(AvailableThermostatMode.HEAT),
    );
    final expectedMin = 20.0;
    final expectedMax = 30.0;
    final targetTemperature = 21.0;
    when(mockThermostatProvider.getHeatTemperatureRange)
        .thenReturn(TemperatureRange(min: expectedMin, max: expectedMax));

    when(mockThermostatProvider.getTargetTemperatureState)
        .thenReturn(targetTemperature);

    await tester.pumpWidget(createMaterialApp(mockThermostatProvider));
    final temperatureSlider = find.byType(TemperatureRangeSlider);
    final slider = find.byType(material.Slider);
    expect((slider.first.evaluate().first.widget as material.Slider).value,
        equals(targetTemperature));
    final sliderWidget = temperatureSlider.first.evaluate().first.widget
        as TemperatureRangeSlider;
    expect(sliderWidget.onChangeEnd, isA<Function>());
    expect(slider, findsOneWidget);
    await tester.tap(slider);
    await tester.pumpAndSettle(Duration(seconds: 2));
    expect((slider.first.evaluate().first.widget as material.Slider).value,
        equals((expectedMax + expectedMin) / 2));
  });
}
