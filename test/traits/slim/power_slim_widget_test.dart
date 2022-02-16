import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../power_widget_test.dart';

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [PowerSlimWidget(mockPowerProvider)])),
  );
}

void main() {
  final test = PowerWidgetTest();
  final defaultDevice = test.device(traits: [
    PowerTrait(IsOnOff(true),
        supportsDiscreteOnOff: SupportsDiscreteOnOff(true))
  ]);

  group("For PowerWidget, ", () {
    testWidgets('When loading, should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice, isLoading: true);
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(PowerSlimWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsNothing);
    });

    testWidgets('When an error occurs, should show some kind of error',
        (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();

      String errorMessage = "An error occurred";
      final mockPowerTraitProvider = test.mockPowerTraitProvider(defaultDevice,
          isInErrorState: true, errorMessage: errorMessage);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));
      await tester.pump(const Duration(milliseconds: 750));

      expect(find.byType(PowerSlimWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('Should show a Switch widget with On state if device is On',
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice, onOffState: false);
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(find.byType(PowerSlimWidget), findsOneWidget);
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

      expect(find.byType(PowerSlimWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == true,
              description: 'Switch is On'),
          findsOneWidget);
    });

    testWidgets(
        "Should run PowerTraitProvider's sendPowerOnOffAction method when Switch is pressed",
        (WidgetTester tester) async {
      final mockPowerTraitProvider =
          test.mockPowerTraitProvider(defaultDevice, onOffState: true);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.tap(find.byType(CupertinoSwitch));

      expect(find.byType(PowerSlimWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      verify(mockPowerTraitProvider.sendPowerOnOffAction(false)).called(1);
    });

    testWidgets(
        "Should run PowerTraitProvider's sendPowerOnOffAction method when button is pressed",
        (WidgetTester tester) async {
      final mockPowerTraitProvider = test.mockPowerTraitProvider(defaultDevice,
          onOffState: true, supportsDiscreteOnOff: false);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.tap(find.byType(IconButton));

      expect(find.byType(PowerSlimWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsNothing);
      expect(find.byType(IconButton), findsOneWidget);

      verify(mockPowerTraitProvider.sendPowerOnOffAction(false)).called(1);
    });
  });
}
