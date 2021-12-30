import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'detail_screen_test.mocks.dart';

MaterialApp createMaterialApp(
    BatteryLevelProvider mockBatteryLevelProvider) {
  return MaterialApp(
    home: Column(children: [BatteryWidget(mockBatteryLevelProvider)]),
  );
}

final device = Device('id', 'name', 'description', 'manufacturerName', 'model',
    null, GDateTime('value'), GDateTime('value'), [LockTrait(IsLocked(true))]);

MockBatteryLevelProvider _getMockBatteryProvider() {
  final mockBatteryLevelProvider = MockBatteryLevelProvider();
  when(mockBatteryLevelProvider.isLoading).thenReturn(false);
  when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
  when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);
  when(mockBatteryLevelProvider.displayName).thenReturn('BATTERY');

  return mockBatteryLevelProvider;
}

@GenerateMocks([BatteryLevelProvider])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = _getMockBatteryProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When battery level is low, should show low battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = _getMockBatteryProvider();
    when(mockBatteryLevelProvider.getBatteryLevel)
        .thenReturn(WidgetStyleConstants.batteryLowMax);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery), findsOneWidget);
    expect(tester.widget<Text>((find.textContaining(' Battery'))).style?.color,
        WidgetStyleConstants.globalWarningColor);
  });

  testWidgets(
      'When battery level is not low or high, should show half battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = _getMockBatteryProvider();
    when(mockBatteryLevelProvider.getBatteryLevel).thenReturn(50);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_half), findsOneWidget);
    expect(tester.widget<Text>((find.textContaining(' Battery'))).style?.color,
        Colors.white);
  });

  testWidgets('When battery level is high, should show full battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = _getMockBatteryProvider();
    when(mockBatteryLevelProvider.getBatteryLevel)
        .thenReturn(WidgetStyleConstants.batteryFullMin);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_full), findsOneWidget);
    expect(tester.widget<Text>((find.textContaining(' Battery'))).style?.color,
        WidgetStyleConstants.globalSuccessColor);
  });

  testWidgets('When battery widget is in error, should show error icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = _getMockBatteryProvider();
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(true);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
