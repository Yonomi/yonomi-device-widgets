import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';

import '../../mixins/device_testing.dart';
import '../../mixins/lock_testing.dart';

class LockWidgetTest with DeviceTesting, LockTesting {}

MaterialApp createMaterialApp(LockProvider mockLockProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [LockSlimWidget(mockLockProvider)])),
  );
}

void main() {
  final test = LockWidgetTest();
  final defaultLock = TestLockDevice(test.device(), isLocked: true);

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
    final mockLockProvider = test.mockLockProvider(defaultLock);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockSlimWidget), findsOneWidget);
    expect(find.byType(LockIcon), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });

  testWidgets('When unlocked, should show lock icon ',
      (WidgetTester tester) async {
    final mockLockProvider = test.mockLockProvider(defaultLock);
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(LockSlimWidget), findsOneWidget);
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
        defaultLock.withIsLocked(currentLock));

    await tester.pumpWidget(createMaterialApp(mockLockProvider));
    expect(find.byType(CupertinoSwitch), findsOneWidget);
    await tester.tap(find.byType(CupertinoSwitch));
    verify(mockLockProvider.setLockUnlockAction(any, !currentLock));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // expect(find.byType(LockIcon), findsNothing);
  });
}
