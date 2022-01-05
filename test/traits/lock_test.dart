import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import '../components/lock_widget_test.mocks.dart';

MaterialApp createMaterialApp(LockProvider mockLockProvider) {
  return MaterialApp(
    home: Column(children: [LockWidget(mockLockProvider)]),
  );
}

@GenerateMocks([LockProvider])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.loadingDetail).thenReturn(true);
    when(mockLockProvider.loadingAction).thenReturn(false);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsNothing);
  });

  testWidgets('When locked, should show lock icon ',
      (WidgetTester tester) async {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.loadingDetail).thenReturn(false);
    when(mockLockProvider.loadingAction).thenReturn(false);
    when(mockLockProvider.isLocked).thenReturn(true);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockIcon), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });

  testWidgets('When unlocked, should show lock icon ',
      (WidgetTester tester) async {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.loadingDetail).thenReturn(false);
    when(mockLockProvider.loadingAction).thenReturn(false);
    when(mockLockProvider.isLocked).thenReturn(false);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockIcon), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });

  testWidgets('When action pending, should show loading icon ',
      (WidgetTester tester) async {
    final mockLockProvider = MockLockProvider();
    when(mockLockProvider.loadingDetail).thenReturn(false);
    when(mockLockProvider.loadingAction).thenReturn(true);
    when(mockLockProvider.isLocked).thenReturn(false);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);

    expect(find.byType(LockIcon), findsNothing);
  });

  testWidgets(
      'When tapped in locked icon, should call lockprovider with unlock',
      (WidgetTester tester) async {
    final mockLockProvider = MockLockProvider();
    final currentLock = true;
    when(mockLockProvider.loadingDetail).thenReturn(false);
    when(mockLockProvider.loadingAction).thenReturn(false);
    when(mockLockProvider.isLocked).thenReturn(currentLock);
    when(mockLockProvider.deviceDetail).thenReturn(Device(
        'id',
        'displayName',
        'description',
        'manufacturerName',
        'model',
        'serialNumber',
        GDateTime('createdAt'),
        GDateTime('updatedAt'),
        [LockTrait(IsLocked(currentLock))]));
    await tester.pumpWidget(createMaterialApp(mockLockProvider));
    expect(find.byType(CupertinoSwitch), findsOneWidget);
    await tester.tap(find.byType(CupertinoSwitch));
    verify(mockLockProvider.setLockUnlockAction(any, !currentLock));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // expect(find.byType(LockIcon), findsNothing);
  });
}
