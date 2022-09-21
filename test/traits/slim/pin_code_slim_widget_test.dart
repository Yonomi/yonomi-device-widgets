import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/pin_code_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../../mixins/device_testing.dart';
import '../../mixins/pin_code_testing.dart';

class PinCodeWidgetTest with DeviceTesting, PinCodeTesting {}

MaterialApp createMaterialApp(PinCodeProvider mockPinCodeProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [PinCodeSlimWidget(mockPinCodeProvider)])),
  );
}

MaterialApp createListView(PinCodeProvider mockPinCodeProvider) {
  return MaterialApp(
    home: new Scaffold(
      body: Container(child: PinCodeListView(provider: mockPinCodeProvider)),
    ),
  );
}

MaterialApp createDetailView(PinCodeProvider mockPinCodeProvider,
    {PinCodeCredential? selectedPinCode}) {
  return MaterialApp(
    home: new Scaffold(
      body: Container(
          child: PinCodeDetailView(
        mockPinCodeProvider,
        selectedPinCode: selectedPinCode,
      )),
    ),
  );
}

void main() {
  final test = PinCodeWidgetTest();
  final defaultPinCode = TestPinCodeDevice(
    test.device(),
    pinCodes: [
      PinCodeCredential('Admin', '5678'),
      PinCodeCredential('Plant Lady', '1234')
    ],
  );

  group('For PinCodeSlimWidget', () {
    testWidgets('When loading, should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      final mockPinCodeProvider =
          test.mockPinCodeProvider(defaultPinCode, isLoading: true);
      await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
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

    testWidgets('When going to listView, should see PinCodeListView widget',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createMaterialApp(mockPinCodeProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(PinCodeSlimWidget), findsOneWidget);
      expect(find.byType(PinCodeIcon), findsOneWidget);

      await tester.tap(find.byIcon(BootstrapIcons.chevron_right));

      await tester.pumpAndSettle();

      expect(find.byType(PinCodeListView), findsOneWidget);
    });
  });
  group('For PinCodeListView', () {
    testWidgets('Should show empty view,', (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(
        TestPinCodeDevice(test.device()),
      );
      await tester.pumpWidget(createListView(mockPinCodeProvider));

      expect(find.text('Admin'), findsNothing);
      expect(find.text('Plant Lady'), findsNothing);

      expect(find.text(StringConstants.PIN_CODES_NO_PIN_CODES), findsOneWidget);
    });

    testWidgets('Should list a few pincodes in a list,',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createListView(mockPinCodeProvider));

      expect(find.text('Admin'), findsOneWidget);
      expect(find.text('Plant Lady'), findsOneWidget);
    });

    testWidgets('Should open the Detail View when pressing + button,',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createListView(mockPinCodeProvider));

      await tester.tap(find.byIcon(BootstrapIcons.plus_circle));

      await tester.pumpAndSettle();

      expect(find.byType(PinCodeDetailView), findsOneWidget);
    });

    testWidgets('Should open the Detail View when pressing > button,',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createListView(mockPinCodeProvider));

      await tester.tap(find.byIcon(BootstrapIcons.chevron_right).first);

      await tester.pumpAndSettle();

      expect(find.byType(PinCodeDetailView), findsOneWidget);
      expect(find.text('Admin'), findsOneWidget);
      expect(find.text('5678'), findsOneWidget);
    });
  });
  group('For PinCodeDetailView', () {
    testWidgets('Shows default view', (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider));

      expect(find.text(StringConstants.PIN_CODES_NEW_PIN_CODE), findsOneWidget);
    });

    testWidgets(
        'Calls createPinCode method in PinCodeProvider after pressing save button',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider));

      await tester.enterText(
          find.byKey(Key(PinCodeDetailView.PIN_CODE_PIN_CODE_NAME_FIELD)),
          '1234');

      await tester.enterText(
          find.byKey(Key(PinCodeDetailView.PIN_CODE_PIN_CODE_FIELD)), '1234');

      await tester.tap(find.byIcon(BootstrapIcons.check2));

      await tester.pumpAndSettle();

      verify(mockPinCodeProvider.sendCreatePinCode('1234', '1234')).called(1);
    });

    testWidgets('Show existing PIN Code details in Edit mode',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);

      await tester.pumpWidget(createDetailView(
        mockPinCodeProvider,
        selectedPinCode: PinCodeCredential('someName', 'somePincode'),
      ));

      expect(find.text(StringConstants.PIN_CODES_NEW_PIN_CODE), findsNothing);
      expect(find.text('someName'), findsOneWidget);
      expect(find.text('somePincode'), findsOneWidget);
    });

    testWidgets(
        'Calls updatePinCode method in PinCodeProvider after pressing save button',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider,
          selectedPinCode: PinCodeCredential('1234', '1234')));

      await tester.tap(find.byIcon(BootstrapIcons.check2));

      await tester.pumpAndSettle();

      verify(mockPinCodeProvider.sendUpdatePinCode('1234', '1234')).called(1);
    });

    testWidgets('Invalid form if empty', (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider,
          selectedPinCode: PinCodeCredential('', '')));

      await tester.tap(find.byIcon(BootstrapIcons.check2));

      await tester.pumpAndSettle();

      verifyNever(mockPinCodeProvider.sendCreatePinCode('', ''));
    });

    testWidgets('Pressing on Delete button shows a confirmation Dialog',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider,
          selectedPinCode: PinCodeCredential('1234', '1234')));

      expect(find.byType(OutlinedButton), findsOneWidget);

      await tester.tap(find.byType(OutlinedButton));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets(
        'Calls deletePinCode method in PinCodeProvider after pressing OK in Confirm Dialog',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider,
          selectedPinCode: PinCodeCredential('1234', '1234')));

      expect(find.byType(OutlinedButton), findsOneWidget);

      await tester.tap(find.byType(OutlinedButton));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text(StringConstants.PIN_CODE_DELETE_ALERT_OK));

      await tester.pumpAndSettle();

      verify(mockPinCodeProvider.sendDeletePinCode('1234', '1234')).called(1);
    });

    testWidgets(
        'Pressing CANCEL on Confirm Dialog for Delete PIN Code Button dismisses Dialog',
        (WidgetTester tester) async {
      final mockPinCodeProvider = test.mockPinCodeProvider(defaultPinCode);
      await tester.pumpWidget(createDetailView(mockPinCodeProvider,
          selectedPinCode: PinCodeCredential('1234', '1234')));

      expect(find.byType(OutlinedButton), findsOneWidget);

      await tester.tap(find.byType(OutlinedButton));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text(StringConstants.PIN_CODE_DELETE_ALERT_CANCEL));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      verifyNever(mockPinCodeProvider.sendDeletePinCode('1234', '1234'));
    });
  });
}
