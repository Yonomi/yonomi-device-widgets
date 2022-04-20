import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/color_widget.dart';

import '../mixins/color_testing.dart';
import '../mixins/device_testing.dart';

class ColorWidgetTest with DeviceTesting, ColorTesting {
  MaterialApp createMaterialApp(ColorProvider mockColorProvider) {
    return MaterialApp(
      home: new Scaffold(body: Scaffold(body: ColorWidget(mockColorProvider))),
    );
  }
}

main() {
  final test = ColorWidgetTest();
  final colorDevice = TestColorDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice, isLoading: true, isBusy: true);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When performing action, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice, isPerformingAction: true);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When color widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice, isInErrorState: true);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));
    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
