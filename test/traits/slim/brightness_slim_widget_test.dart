import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/brightness_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/brightness_slim_widget.dart';

import '../../mixins/brightness_testing.dart';
import '../../mixins/device_testing.dart';

class BatterySlimWidgetTest with DeviceTesting, BrightnessTesting {}

MaterialApp createMaterialApp(BrightnessProvider mockBrightnessProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Scaffold(body: BrightnessSlimWidget(mockBrightnessProvider))),
  );
}

void main() {
  final test = BatterySlimWidgetTest();
  final brightnessDevice = TestBrightnessDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBrightnessProvider =
        test.mockBrightnessProvider(brightnessDevice);
    when(mockBrightnessProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBrightnessProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
