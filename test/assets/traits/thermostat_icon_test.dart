import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

Widget createIconWidget(
    {double? thermostatState, Decoration? decoration, TextStyle? textStyle}) {
  return MaterialApp(
    home: Scaffold(
      body: Container(
          child: ThermostatIcon(
        thermostatState: thermostatState,
        decoration: decoration,
        textStyle: textStyle,
      )),
    ),
  );
}

void main() {
  testWidgets('should render correct thermostat trait icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(createIconWidget(thermostatState: 22.1));
    expect(find.widgetWithText(Center, '22'), findsOneWidget);
  });

  testWidgets('should render n/a if target temperature is null',
      (WidgetTester tester) async {
    await tester.pumpWidget(createIconWidget());
    expect(find.widgetWithText(Center, 'N/A'), findsOneWidget);
  });
}
