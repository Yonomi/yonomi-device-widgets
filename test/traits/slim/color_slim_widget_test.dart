import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/color_slim_widget.dart';

import '../../mixins/color_testing.dart';
import '../../mixins/device_testing.dart';

class ColorSlimWidgetTest with DeviceTesting, ColorTesting {
  MaterialApp createMaterialApp(ColorProvider mockColorProvider) {
    return MaterialApp(
      home: new Scaffold(
          body: Scaffold(body: ColorSlimWidget(mockColorProvider))),
    );
  }
}

void main() {
  final test = ColorSlimWidgetTest();
  final colorDevice = TestColorDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorProvider = test.mockColorProvider(colorDevice);
    when(mockColorProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When widget color state value is null, should call provider for color',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice.withColor(null));

    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));

    verify(mockColorProvider.getColorState).called(2);
  });
}
