import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/battery_level_icon.dart';
import 'package:yonomi_device_widgets/providers/battery_level_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/battery_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'battery_widget_test.mocks.dart';

MaterialApp createMaterialApp(
    BatteryLevelTraitProvider mockBatteryLevelProvider) {
  return MaterialApp(
    home: Column(children: [BatteryWidget(mockBatteryLevelProvider)]),
  );
}

final device = Device('id', 'name', 'description', 'manufacturerName', 'model',
    null, GDateTime('value'), GDateTime('value'), [LockTrait(IsLocked(true))]);

@GenerateMocks([BatteryLevelTraitProvider])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = MockBatteryLevelTraitProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(true);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('When battery level is low, should show low battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = MockBatteryLevelTraitProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(false);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
    when(mockBatteryLevelProvider.getBatteryLevel)
        .thenReturn(WidgetStyleConstants.batteryLowMax);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery), findsOneWidget);
  });

  testWidgets(
      'When battery level is not low or high, should show half battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = MockBatteryLevelTraitProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(false);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
    when(mockBatteryLevelProvider.getBatteryLevel).thenReturn(50);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_half), findsOneWidget);
  });

  testWidgets('When battery level is high, should show full battery icon',
      (WidgetTester tester) async {
    final mockBatteryLevelProvider = MockBatteryLevelTraitProvider();
    when(mockBatteryLevelProvider.isLoading).thenReturn(false);
    when(mockBatteryLevelProvider.isInErrorState).thenReturn(false);
    when(mockBatteryLevelProvider.getBatteryLevel)
        .thenReturn(WidgetStyleConstants.batteryFullMin);
    when(mockBatteryLevelProvider.deviceDetail).thenReturn(device);

    await tester.pumpWidget(createMaterialApp(mockBatteryLevelProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(BatteryWidget), findsOneWidget);
    expect(find.byType(BatteryLevelIcon), findsOneWidget);
    expect(find.byIcon(BootstrapIcons.battery_full), findsOneWidget);
  });
}
