import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/color_temperature_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/color_temperature_slim_widget.dart';

import '../../mixins/color_temperature_testing.dart';
import '../../mixins/device_testing.dart';

class ColorTemperatureSlimWidgetTest
    with DeviceTesting, ColorTemperatureTesting {}

MaterialApp createMaterialApp(
    ColorTemperatureProvider mockColorTemperatureProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Scaffold(
      body: ColorTemperatureSlimWidget(mockColorTemperatureProvider),
    )),
  );
}

void main() {
  final test = ColorTemperatureSlimWidgetTest();
  final colorTemperatureDevice = TestColorTemperatureDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider =
        test.mockColorTemperatureProvider(colorTemperatureDevice);
    when(mockColorTemperatureProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider =
        test.mockColorTemperatureProvider(colorTemperatureDevice);
    when(mockColorTemperatureProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When slider moved, should execute call for color temperature change ',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider = test.mockColorTemperatureProvider(
        colorTemperatureDevice.withColorTemperature(10));

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    await tester.drag(find.byType(Slider), Offset(100, 0));

    verify(mockColorTemperatureProvider.setColorTemperatureAction(any))
        .called(1);
  });

  testWidgets(
      'When widget color temp state value is null, should call provider for color temperature',
      (WidgetTester tester) async {
    final mockColorTemperatureProvider = test.mockColorTemperatureProvider(
        colorTemperatureDevice.withColorTemperature(null));

    await tester.pumpWidget(createMaterialApp(mockColorTemperatureProvider));

    verify(mockColorTemperatureProvider.getColorTemperatureState).called(2);
  });
}
