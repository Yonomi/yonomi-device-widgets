import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/components/arc.dart';

/// When adding or updating tests, run the following to generate / update
/// Golden Image Files (and add them to version control):
///
/// ```flutter test --update-goldens test/components/arc_test.dart```
///
Widget createArcWidget({ValueChanged<double> callback}) {
  return MaterialApp(
    home: Column(children: [
      Arc(
          centerWidget: Text('centerWidget'),
          initialValue: 5,
          onFinalSetPoint: callback ?? (double value) => print(value),
          maxValue: 100)
    ]),
  );
}

void main() {
  testWidgets('Widget should match default view', (WidgetTester tester) async {
    await tester.pumpWidget(createArcWidget());

    await tester.pumpAndSettle();

    expectLater(
      find.byType(Arc),
      matchesGoldenFile('golden/arc_default_view.png'),
      skip: !Platform.isMacOS,
    );
  });

  testWidgets('Center widget should be rendered', (WidgetTester tester) async {
    await tester.pumpWidget(createArcWidget());

    expect(find.widgetWithText(Arc, 'centerWidget'), findsOneWidget);
  });

  testWidgets('Widget - starting point', (WidgetTester tester) async {
    int endValue = 0;
    ValueChanged<double> endValueCallback(double value) {
      endValue = value.round();
    }

    ;

    MaterialApp arc = createArcWidget(callback: endValueCallback);

    await tester.pumpWidget(arc);
    await tester.pumpAndSettle();

    final TestGesture gesture =
        await tester.startGesture(const Offset(299, 322));

    await tester.pump(kPressTimeout);
    await gesture.up();

    await tester.pumpAndSettle();

    expect(endValue, equals(5));
  });

  testWidgets('Widget - last value', (WidgetTester tester) async {
    int endValue = 0;
    ValueChanged<double> endValueCallback(double value) {
      endValue = value.round();
    }

    ;

    MaterialApp arc = createArcWidget(callback: endValueCallback);

    await tester.pumpWidget(arc);
    await tester.pumpAndSettle();

    final TestGesture gesture =
        await tester.startGesture(const Offset(448, 323));

    await tester.pump(kPressTimeout);
    await gesture.up();

    await tester.pumpAndSettle();

    expect(endValue, equals(100));
  });
}
