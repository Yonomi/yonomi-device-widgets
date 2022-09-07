import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/pin_code_widget.dart';

import '../mixins/device_testing.dart';
import '../mixins/pin_code_testing.dart';

class PinCodeWidgetTest with DeviceTesting, PinCodeTesting {}

MaterialApp createMaterialApp(PinCodeProvider mockLockProvider) {
  return MaterialApp(
    home: Column(children: [PinCodeWidget(mockLockProvider)]),
  );
}

void main() {
  final test = PinCodeWidgetTest();
  final defaultLock = TestPinCodeDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockPinCodeProvider =
        test.mockPinCodeProvider(defaultLock, isLoading: true);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
