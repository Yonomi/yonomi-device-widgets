import 'package:yonomi_device_widgets/components/modes_toolbar.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_sdk_dart/graphql/devices/thermostat/thermostat_queries.graphql.dart';

class MockThermostatProvider extends Mock implements ThermostatProvider {}

MockThermostatProvider mockProvider = MockThermostatProvider();

Widget createModesToolbar() {
  return MaterialApp(
    home: ChangeNotifierProvider<ThermostatProvider>(
      create: (_) => mockProvider,
      child: Column(children: [
        ModesToolbar(deviceId: ""),
      ]),
    ),
  );
}

void main() {
  testWidgets('Setup - ModesToolbar should contain specific icons',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    expect(find.widgetWithText(ModeIconButton, "A"), findsOneWidget);
    expect(find.widgetWithIcon(ModeIconButton, Icons.ac_unit), findsOneWidget);
    expect(find.widgetWithIcon(ModeIconButton, Icons.whatshot), findsOneWidget);
    expect(find.widgetWithIcon(ModeIconButton, Icons.eco), findsOneWidget);
  });

  testWidgets('ModesToolbar - button should set mode to auto when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithText(ModeIconButton, "A"));

    verify(mockProvider.setThermostatMode(any, ThermostatMode.auto)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to cool when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.ac_unit));

    verify(mockProvider.setThermostatMode(any, ThermostatMode.cool)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to heat when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.whatshot));

    verify(mockProvider.setThermostatMode(any, ThermostatMode.heat)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to eco when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.eco));

    verify(mockProvider.setThermostatMode(any, ThermostatMode.airflow))
        .called(1);
  });
}
