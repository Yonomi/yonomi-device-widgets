import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/components/modes_toolbar.dart';
import 'package:yonomi_device_widgets/providers/thermostat_provider.dart';
import 'package:yonomi_device_widgets/ui/ring_border.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';

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

    verify(mockProvider.setThermostatMode(any, GThermostatMode.AUTO)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to cool when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.ac_unit));

    verify(mockProvider.setThermostatMode(any, GThermostatMode.COOL)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to heat when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.whatshot));

    verify(mockProvider.setThermostatMode(any, GThermostatMode.HEAT)).called(1);
  });

  testWidgets('ModesToolbar - button should set mode to eco when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(createModesToolbar());

    await tester.tap(find.widgetWithIcon(ModeIconButton, Icons.eco));

    verify(mockProvider.setThermostatMode(any, GThermostatMode.AIRFLOW))
        .called(1);
  });

  testWidgets(
      'ModesToolbar - ModeIconButton should have a RingBorder shape when pressed',
      (WidgetTester tester) async {
    const Set<MaterialState> pressed = <MaterialState>{MaterialState.pressed};

    var toolbar = createModesToolbar();
    await tester.pumpWidget(toolbar);

    final Finder modeIconButtonFinder =
        find.widgetWithIcon(ModeIconButton, Icons.eco);
    await tester.press(modeIconButtonFinder);

    await tester.pumpAndSettle();

    final modeButton = tester.widget<ModeIconButton>(modeIconButtonFinder);

    expect(modeButton.style!.shape!.resolve(pressed), isA<RingBorder>());
  });

  testWidgets(
      'ModesToolbar - ModeIconButton should have a RingBorder shape when focused',
      (WidgetTester tester) async {
    const Set<MaterialState> focused = <MaterialState>{MaterialState.focused};

    var toolbar = createModesToolbar();
    await tester.pumpWidget(toolbar);

    final Finder modeIconButtonFinder =
        find.widgetWithIcon(ModeIconButton, Icons.eco);
    await tester.press(modeIconButtonFinder);

    await tester.pumpAndSettle();

    final modeButton = tester.widget<ModeIconButton>(modeIconButtonFinder);

    expect(modeButton.style!.shape!.resolve(focused), isA<RingBorder>());
  });
}
