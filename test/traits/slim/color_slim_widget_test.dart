import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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

  testWidgets('When an error occurs, should show some kind of error',
      (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    String errorMessage = "An error occurred";
    final mockPowerTraitProvider = test.mockColorProvider(colorDevice,
        isInErrorState: true, errorMessage: errorMessage);

    await tester.pumpWidget(test.createMaterialApp(mockPowerTraitProvider));
    await tester.pump(const Duration(milliseconds: 750));

    expect(find.byType(ColorSlimWidget), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byIcon(Icons.error), findsOneWidget);
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
