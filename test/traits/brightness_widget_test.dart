import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/traits/brightness_widget.dart';

import '../mixins/brightness_testing.dart';
import '../mixins/device_testing.dart';

class BrightnessWidgetTest with DeviceTesting, BrightnessTesting {}

MaterialApp createMaterialApp(BrightnessProvider mockBrightnessProvider) {
  return MaterialApp(
    home: Scaffold(
        body: Column(children: [BrightnessWidget(mockBrightnessProvider)])),
  );
}

main() {
  final test = BrightnessWidgetTest();
  final brightnessDevice = TestBrightnessDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice);
    when(mockBrightnessProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When performing action, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice);
    when(mockBrightnessProvider.isPerformingAction).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When battery widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice);
    when(mockBrightnessProvider.isInErrorState).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
