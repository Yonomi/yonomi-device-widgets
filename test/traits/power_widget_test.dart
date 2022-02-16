import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';

import 'mixins/device_testing.dart';
import 'mixins/power_widget_testing.dart';

class PowerWidgetTest with DeviceTesting, PowerWidgetTesting {}

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: Scaffold(body: Column(children: [PowerWidget(mockPowerProvider)])),
  );
}

void main() {
  final test = PowerWidgetTest();
  final defaultDevice = TestPower(test.device());

  group("For PowerWidget, ", () {
    testWidgets('When loading, should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice, isBusy: true);
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsNothing);
    });

    testWidgets('When an error occurs, should show some kind of error',
        (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();

      String errorMessage = "An error occurred";
      final mockPowerTraitProvider = test.mockPowerTraitProvider(defaultDevice,
          isInErrorState: true, errorMessage: errorMessage);

      // tester.binding.scheduleFrame();
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.pump(const Duration(milliseconds: 750));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsOneWidget);
      // expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('Should show a Switch widget with On state if device is On',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice.withIsOn(false));
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == false,
              description: 'Switch is Off'),
          findsOneWidget);
    });

    testWidgets(
        'Should show a Switch widget with Off state if device is Off when supportsDiscreteToggle',
        (WidgetTester tester) async {
      final mockPowerTraitProvider = test.mockPowerTraitProvider(defaultDevice);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == true,
              description: 'Switch is On'),
          findsOneWidget);
    });

    testWidgets(
        'Should not show a Switch widget with Off state if device is Off when supportsDiscreteToggle is false',
        (WidgetTester tester) async {
      final mockPowerTraitProvider = test.mockPowerTraitProvider(
          defaultDevice.withSupportsDiscreteOnOff(false));

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == true,
              description: 'Switch is On'),
          findsNothing);
    });

    testWidgets(
        'Should run PowerTraitProvider\'s sendPowerOnOffAction method when Switch is pressed',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.tap(find.byType(CupertinoSwitch));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      verify(mockPowerTraitProvider.sendPowerOnOffAction(false)).called(1);
    });

    testWidgets(
        'Should run PowerTraitProvider\'s sendPowerOnOffAction method when button is pressed',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.tap(find.byType(IconButton));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(IconButton), findsOneWidget);
      verify(mockPowerTraitProvider.sendPowerOnOffAction(false)).called(1);
    });
  });
}
