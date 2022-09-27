import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/pin_code_widget.dart';

import '../mixins/device_testing.dart';
import '../mixins/pin_code_testing.dart';

class PinCodeWidgetTest with DeviceTesting, PinCodeTesting {}

MaterialApp createMaterialApp(PinCodeProvider mockPinCodeProvider) {
  return MaterialApp(
    home: Scaffold(
      body: Column(children: [PinCodeWidget(mockPinCodeProvider)]),
    ),
  );
}

void main() {
  final test = PinCodeWidgetTest();
  final defaultPinCode = TestPinCodeDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator',
      (WidgetTester tester) async {
    final mockPinCodeProvider =
        test.mockPinCodeProvider(defaultPinCode, isLoading: true);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When idle, should show Pin Code Icon',
      (WidgetTester tester) async {
    final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(PinCodeIcon), findsOneWidget);
  });

  testWidgets('When an error occurs, should show an Error icon',
      (WidgetTester tester) async {
    final mockPinCodeProvider =
        test.mockPinCodeProvider(defaultPinCode, isInErrorState: true);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
