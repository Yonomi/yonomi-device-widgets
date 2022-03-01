import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/battery_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

import '../../mixins/battery_testing.dart';
import '../../mixins/device_testing.dart';

class BatterySlimWidgetTest with DeviceTesting, BatteryTesting {}

MaterialApp createMaterialApp(BatteryLevelProvider mockBatteryLevelProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [BatterySlimWidget(mockBatteryLevelProvider)])),
  );
}

void main() {
  final test = BatterySlimWidgetTest();
  final batteryDevice = TestBatteryDevice(test.device());

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider =
        test.mockBatteryLevelProvider(batteryDevice);
    when(mockBatteryLevelProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When battery level is low, should show low battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = test.mockBatteryLevelProvider(
        batteryDevice.withBatteryLevel(WidgetStyleConstants.batteryLowMax));
    when(mockBatteryLevelProvider.getBatteryLevelState)
        .thenReturn(WidgetStyleConstants.batteryLowMax);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatterySlimWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery), findsOneWidget);
    expect(
        tester
            .widget<Text>((find.textContaining(
                'Battery Level: ${WidgetStyleConstants.batteryLowMax}%')))
            .style
            ?.color,
        WidgetStyleConstants.globalWarningColor);
  });

  testWidgets('When battery level is full, should show full battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = test.mockBatteryLevelProvider(
        batteryDevice.withBatteryLevel(WidgetStyleConstants.batteryFullMin));
    when(mockBatteryLevelProvider.getBatteryLevelState)
        .thenReturn(WidgetStyleConstants.batteryFullMin);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatterySlimWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_full), findsOneWidget);
    expect(
        tester
            .widget<Text>((find.textContaining(
                'Battery Level: ${WidgetStyleConstants.batteryFullMin}%')))
            .style
            ?.color,
        WidgetStyleConstants.globalSuccessColor);
  });

  testWidgets(
      'When battery level is not low or high, should show half battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider =
        test.mockBatteryLevelProvider(batteryDevice.withBatteryLevel(50));
    when(mockBatteryLevelProvider.getBatteryLevelState).thenReturn(50);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatterySlimWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_half), findsOneWidget);
    expect(
        tester
            .widget<Text>((find.textContaining('Battery Level: 50%')))
            .style
            ?.color,
        WidgetStyleConstants.darkTextColor);
  });
}
