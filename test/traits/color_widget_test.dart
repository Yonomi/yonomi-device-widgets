import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_provider.dart';
import 'package:yonomi_device_widgets/traits/color_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

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
  final colorDevice =
      TestColorDevice(test.device(),
      colorTrait: ColorTrait(HSBColor(130, 50, 50)));

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

  testWidgets('When color widget is valid, should show color device',
      (WidgetTester tester) async {
    final mockColorProvider = test.mockColorProvider(colorDevice);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));

    expect(find.byIcon(BootstrapIcons.box), findsOneWidget);
    expect(mockColorProvider.displayName, colorDevice.displayName);
    expect(mockColorProvider.getColorTrait,
        colorDevice.traits.firstWhere((t) => t is ColorTrait));
  });

  testWidgets(
      'When widget color state value is null, should call provider for color',
      (WidgetTester tester) async {
    final mockColorProvider =
        test.mockColorProvider(colorDevice.withColor(null));
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));
    verify(mockColorProvider.getColorState).called(1);
  });

  testWidgets('When edit clicked, should show color picker',
      (WidgetTester tester) async {
    final mockColorProvider = test.mockColorProvider(colorDevice);
    await tester.pumpWidget(test.createMaterialApp(mockColorProvider));

    await tester.tap(find.byIcon(BootstrapIcons.pencil));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(SlidePicker), findsOneWidget);

    await tester.drag(find.byType(ColorPickerSlider).first, Offset(100, 0));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    verify(mockColorProvider.setColorAction(any)).called(3);
  });
}
