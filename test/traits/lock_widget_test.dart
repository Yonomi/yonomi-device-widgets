import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'mixins/device_testing.dart';
import 'mixins/lock_widget_testing.dart';

class LockWidgetTest with DeviceTesting, LockWidgetTesting {}

MaterialApp createMaterialApp(LockProvider mockLockProvider) {
  return MaterialApp(
    home: Column(children: [LockWidget(mockLockProvider)]),
  );
}

void main() {
  final test = LockWidgetTest();
  final defaultLock = test.device([
    LockTrait({IsLocked(true)}, {SupportsIsJammed(false)})
  ]);

  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockLockProvider =
        test.mockLockProvider(defaultLock, isLoading: true);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsNothing);
  });

  testWidgets('When locked, should show lock icon ',
      (WidgetTester tester) async {
    final mockLockProvider = test.mockLockProvider(defaultLock, isLocked: true);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockIcon), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });

  testWidgets('When unlocked, should show lock icon ',
      (WidgetTester tester) async {
    final mockLockProvider = test.mockLockProvider(defaultLock);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockIcon), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });

  testWidgets('When action pending, should show loading icon ',
      (WidgetTester tester) async {
    final mockLockProvider =
        test.mockLockProvider(defaultLock, isPerformingAction: true);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);

    expect(find.byType(LockIcon), findsNothing);
  });

  testWidgets(
      'When tapped in locked icon, should call lockprovider with unlock',
      (WidgetTester tester) async {
    final currentLock = true;
    final mockLockProvider = test.mockLockProvider(
        test.device([
          LockTrait({IsLocked(currentLock)}, {SupportsIsJammed(false)})
        ]),
        isLocked: currentLock);

    await tester.pumpWidget(createMaterialApp(mockLockProvider));
    expect(find.byType(CupertinoSwitch), findsOneWidget);
    await tester.tap(find.byType(CupertinoSwitch));
    verify(mockLockProvider.setLockUnlockAction(any, !currentLock));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // expect(find.byType(LockIcon), findsNothing);
  });
}
