import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/color_slim_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../../mixins/color_testing.dart';
import '../../mixins/device_testing.dart';

class ColorSlimWidgetTest with DeviceTesting, ColorTesting {
  MaterialApp createMaterialApp(ColorProvider mockColorProvider) {
    return MaterialApp(
      home: new Scaffold(
            body: Column(children: [ColorSlimWidget(mockColorProvider)]))
    );
  }
}

void main() {
  final test = ColorSlimWidgetTest();
  final colorDevice =
      TestColorDevice(test.device(), colorTrait: ColorTrait(HSBColor(130, 50, 50)));

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice, isLoading: true);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
