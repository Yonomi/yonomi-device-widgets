import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../mixins/battery_widget_testing.dart';
import '../mixins/device_testing.dart';
import '../mixins/power_widget_testing.dart';

class DeviceSlimWidgetTest
    with DeviceTesting, BatteryWidgetTesting, PowerWidgetTesting {}

class TestWidget extends BaseSlimWidget {
  TestWidget(DeviceProvider provider, [Widget? content])
      : super(
            leftIcon: UnknownItemIcon(),
            rightIcon: UnknownItemIcon(),
            provider: provider,
            backgroundColor: Colors.white,
            headerText: Text('Test Widget'),
            content: content);
}

MaterialApp createMaterialApp(TestWidget testWidget) {
  return MaterialApp(
    home: new Scaffold(body: testWidget),
  );
}

void main() {
  final test = DeviceSlimWidgetTest();
  final device = test.device([UnknownTrait('name')]);

  testWidgets(
      'When a content widget is performing an action a circular progress indicator is displayed',
      (WidgetTester tester) async {
    final device = test.device([
      PowerTrait(IsOnOff(false), [SupportsToggle(true)])
    ]);
    final provider = test.mockPowerTraitProvider(device);

    when(provider.isLoading).thenReturn(false);
    when(provider.isPerformingAction).thenReturn(true);

    final testWidget = TestWidget(provider, Text('Content'));
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(provider.isPerformingAction, equals(true));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When a no content widget is loading a circular progress indicator is displayed',
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(device);
    when(provider.isLoading).thenReturn(true);

    final testWidget = TestWidget(provider);
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(provider.isLoading, equals(true));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When a widget has detailed content an expandable widget is provided',
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(device);
    final testWidget = TestWidget(provider, Text('Content'));
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(find.byType(ExpansionTile), findsOneWidget);
  });

  testWidgets(
      "When a widget doesn't have detailed content an info widget is provided",
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(device);
    final testWidget = TestWidget(provider);
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(find.byType(ListTile), findsOneWidget);
  });
}
