import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'mixins/device_testing.dart';
import 'mixins/power_widget_testing.dart';

class PowerWidgetTest with DeviceTesting, PowerWidgetTesting {}

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: Column(children: [PowerWidget(mockPowerProvider)]),
  );
}

void main() {
  final test = PowerWidgetTest();
  final defaultDevice = test.device([PowerTrait(IsOnOff(true))]);

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
          test.mockPowerTraitProvider(defaultDevice, onOffState: false);
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == false,
              description: 'Switch is Off'),
          findsOneWidget);
    });

    testWidgets('Should show a Switch widget with Off state if device is Off',
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
        'Should run PowerTraitProvider\'s sendPowerOnOffAction method when Switch is pressed',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice, onOffState: true);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.tap(find.byType(CupertinoSwitch));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      verify(mockPowerTraitProvider.sendPowerOnOffAction(false)).called(1);
    });
  });
}
