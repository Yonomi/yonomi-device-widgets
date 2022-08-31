import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/pin_code_slim_widget.dart';

import '../../mixins/device_testing.dart';
import '../../mixins/pin_code_testing.dart';

class PinCodeWidgetTest with DeviceTesting, PinCodeTesting {}

MaterialApp createMaterialApp(PinCodeProvider mockPinCodeProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [PinCodeSlimWidget(mockPinCodeProvider)])),
  );
}

void main() {
  final test = PinCodeWidgetTest();
  final defaultPinCode = TestPinCodeDevice(test.device(), pinCodes: const []);

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockPinCodeProvider =
        test.mockPinCodeProvider(defaultPinCode, isLoading: true);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsNothing);
  });

  testWidgets('When action pending, should show loading icon ',
      (WidgetTester tester) async {
    final mockPinCodeProvider =
        test.mockPinCodeProvider(defaultPinCode, isPerformingAction: true);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(PinCodeIcon), findsNothing);
  });

  testWidgets('When idle, should show default view',
      (WidgetTester tester) async {
    final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
    await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(PinCodeSlimWidget), findsOneWidget);
    expect(find.byType(PinCodeIcon), findsOneWidget);
  });
}
