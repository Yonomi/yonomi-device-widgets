import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/brightness_slim_widget.dart';

import '../../mixins/brightness_testing.dart';
import '../../mixins/device_testing.dart';

class BrightnessSlimWidgetTest with DeviceTesting, BrightnessTesting {}

MaterialApp createMaterialApp(BrightnessProvider mockBrightnessProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Scaffold(body: BrightnessSlimWidget(mockBrightnessProvider))),
  );
}

void main() {
  final test = BrightnessSlimWidgetTest();
  final brightnessDevice = TestBrightnessDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice);
    when(mockBrightnessProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When slider moved, should execute call for brightness change ',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice.withBrightness(10));

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    await tester.drag(find.byType(Slider), Offset(100, 0));

    verify(mockBrightnessProvider.setBrightnessLevelAction(any)).called(1);
  });

  testWidgets(
      'When widget brightness state value is null, should call provider for brightness',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice.withBrightness(null));

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    verify(mockBrightnessProvider.getBrightnessState).called(2);
  });
}
