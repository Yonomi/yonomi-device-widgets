import 'package:yonomi_device_widgets/components/device_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createDeviceControlWidget(bool initialValue,
    {void Function(bool)? callback}) {
  return MaterialApp(
    home: Scaffold(
      body: DeviceControl(
        onOff: initialValue,
        onChangedCallback: callback,
      ),
    ),
  );
}

void main() {
  testWidgets('Switch should exist', (WidgetTester tester) async {
    await tester.pumpWidget(createDeviceControlWidget(false));

    expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is Switch,
          description: 'switch widget',
        ),
        findsOneWidget);
  });

  testWidgets('On should be rendered if it is On', (WidgetTester tester) async {
    await tester.pumpWidget(createDeviceControlWidget(true));

    expect(find.widgetWithText(DeviceControl, 'On'), findsOneWidget);
  });

  testWidgets('Off should be rendered if it is off',
      (WidgetTester tester) async {
    await tester.pumpWidget(createDeviceControlWidget(false));

    expect(find.widgetWithText(DeviceControl, 'Off'), findsOneWidget);
  });

  testWidgets('Switch should toggle', (WidgetTester tester) async {
    var toggledValue = false;
    ValueChanged<bool>? endValueCallback(bool value) {
      toggledValue = value;
    }

    await tester.pumpWidget(
        createDeviceControlWidget(false, callback: endValueCallback));

    expect(find.widgetWithText(DeviceControl, 'Off'), findsOneWidget,
        reason: 'Device Off not found');

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(toggledValue, isTrue, reason: 'Device callback not called');
  });
}
