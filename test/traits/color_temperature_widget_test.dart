import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/traits/color_temperature_widget.dart';

import '../mixins/color_temperature_testing.dart';
import '../mixins/device_testing.dart';

class ColorTemperatureWidgetTest with DeviceTesting, ColorTemperatureTesting {}

MaterialApp createMaterialApp(
    ColorTemperatureProvider mockColorTemperatureProvider) {
  return MaterialApp(
    home: Scaffold(
        body: Column(
            children: [ColorTemperatureWidget(mockColorTemperatureProvider)])),
  );
}

main() {
  final test = ColorTemperatureWidgetTest();
  final colorTemperatureDevice = TestColorTemperatureDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider =
        test.mockColorTemperatureProvider(colorTemperatureDevice);
    when(mockColorTemperatureProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When performing action, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider =
        test.mockColorTemperatureProvider(colorTemperatureDevice);
    when(mockColorTemperatureProvider.isPerformingAction).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When battery widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider =
        test.mockColorTemperatureProvider(colorTemperatureDevice);
    when(mockColorTemperatureProvider.isInErrorState).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });

  testWidgets('When slider moved, should execute call for brightness change ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider = test.mockColorTemperatureProvider(
        colorTemperatureDevice.withColorTemperature(10));

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    await tester.drag(find.byType(Slider), Offset(100, 0));
    verify(mockColorTemperatureProvider.setColorTemperatureAction(any))
        .called(1);
  });

  testWidgets(
      'When widget brightness state value is null, should call provider for brightness',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider = test.mockColorTemperatureProvider(
        colorTemperatureDevice.withColorTemperature(null));

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    verify(mockColorTemperatureProvider.getColorTemperatureState).called(2);
  });
}
