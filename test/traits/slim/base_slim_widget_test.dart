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

typedef CreateWidget = Widget Function(BuildContext context);

class BaseSlimWidgetTest
    with DeviceTesting, BatteryWidgetTesting, PowerWidgetTesting {}

class TestWidget extends BaseSlimWidget {
  TestWidget(DeviceProvider provider, [CreateWidget? createContent])
      : super(
            leftIcon: UnknownItemIcon(),
            rightIcon: UnknownItemIcon(),
            provider: provider,
            backgroundColor: Colors.white,
            headerText: Text('Test Widget'),
            createContent: createContent);
}

MaterialApp createMaterialApp(TestWidget testWidget) {
  return MaterialApp(
    home: new Scaffold(body: testWidget),
  );
}

void main() {
  final test = BaseSlimWidgetTest();
  final powerDevice = TestPowerDevice(test.device());
  final batteryDevice = TestBatteryDevice(test.device());

  testWidgets(
      'When a content widget is performing an action a circular progress indicator is displayed',
      (WidgetTester tester) async {
    final provider = test.mockPowerTraitProvider(powerDevice);

    when(provider.isLoading).thenReturn(false);
    when(provider.isPerformingAction).thenReturn(true);

    final testWidget = TestWidget(provider, (context) => Text('Content'));
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(provider.isPerformingAction, equals(true));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When a no content widget is loading a circular progress indicator is displayed',
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(batteryDevice);
    when(provider.isLoading).thenReturn(true);

    final testWidget = TestWidget(provider);
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(provider.isLoading, equals(true));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'When a widget has detailed content an expandable widget is provided',
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(batteryDevice);
    final testWidget = TestWidget(provider, (context) => Text('Content'));
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(find.byType(ExpansionTile), findsOneWidget);
  });

  testWidgets(
      "When a widget doesn't have detailed content an info widget is provided",
      (WidgetTester tester) async {
    final provider = test.mockBatteryLevelProvider(batteryDevice);
    final testWidget = TestWidget(provider);
    await tester.pumpWidget(createMaterialApp(testWidget));

    expect(find.byType(ListTile), findsOneWidget);
  });
}
