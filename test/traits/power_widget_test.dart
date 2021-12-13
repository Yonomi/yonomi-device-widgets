import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';

import 'power_widget_test.mocks.dart';

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: Column(children: [PowerWidget(mockPowerProvider)]),
  );
}

@GenerateMocks([PowerTraitProvider])
void main() {
  group("For PowerWidget, ", () {
    testWidgets('When loading, should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      final mockPowerTraitProvider = MockPowerTraitProvider();
      when(mockPowerTraitProvider.isBusy).thenReturn(true);
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsNothing);
    });

    testWidgets('When an error occurs, should show some kind of error',
        (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();

      String errorMessage = "An error occurred";
      final mockPowerTraitProvider = MockPowerTraitProvider();
      when(mockPowerTraitProvider.isBusy).thenReturn(false);
      when(mockPowerTraitProvider.isInErrorState).thenReturn(true);
      when(mockPowerTraitProvider.getErrorMessage).thenReturn(errorMessage);

      // tester.binding.scheduleFrame();
      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      await tester.pump(const Duration(milliseconds: 750));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsOneWidget);
      // expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('Should show a Switch widget with On state if device is On',
        (WidgetTester tester) async {
      final mockPowerTraitProvider = MockPowerTraitProvider();
      when(mockPowerTraitProvider.isBusy).thenReturn(false);
      when(mockPowerTraitProvider.isInErrorState).thenReturn(false);
      when(mockPowerTraitProvider.getOnOffState).thenReturn(false);

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
      final mockPowerTraitProvider = MockPowerTraitProvider();
      when(mockPowerTraitProvider.isBusy).thenReturn(false);
      when(mockPowerTraitProvider.isInErrorState).thenReturn(false);
      when(mockPowerTraitProvider.getOnOffState).thenReturn(true);

      await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is CupertinoSwitch && widget.value == true,
              description: 'Switch is On'),
          findsOneWidget);
    });
  });
}
