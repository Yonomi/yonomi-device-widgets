import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/thermostat_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

Key key = Key('Thermostat');
Widget createIconWidget(
    {double? thermostatState, Decoration? decoration, TextStyle? textStyle}) {
  return MaterialApp(
    home: Scaffold(
      body: Container(
          child: ThermostatIcon(
        key: key,
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

  testWidgets('should render with style parameter values',
      (WidgetTester tester) async {
    double borderWidth = WidgetStyleConstants.defaultBorderWidth + 1;
    TextStyle style = TextStyle(color: Colors.purple);
    Decoration decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(69),
        border: Border.all(width: borderWidth, color: Colors.pink));

    await tester.pumpWidget(createIconWidget(
        decoration: decoration, textStyle: style, thermostatState: 21.1));
    ThermostatIcon icon = tester.firstWidget(find.byKey(key));

    assert(icon.textStyle == style);
    assert(icon.decoration == decoration);
    assert(icon.state == "21");
  });
}
