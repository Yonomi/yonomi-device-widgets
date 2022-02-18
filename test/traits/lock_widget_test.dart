import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/lock_widget.dart';
import 'package:yonomi_device_widgets/ui/notification_bar.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';

import 'mixins/device_testing.dart';
import 'mixins/lock_testing.dart';

class LockWidgetTest with DeviceTesting, LockTesting {}

MaterialApp createMaterialApp(LockProvider mockLockProvider) {
  return MaterialApp(
    home: Column(children: [LockWidget(mockLockProvider)]),
  );
}

void main() {
  final test = LockWidgetTest();
  final defaultLock = TestLockDevice(test.device());

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
    final mockLockProvider =
        test.mockLockProvider(defaultLock.withIsLocked(true));
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
    final mockLockProvider =
        test.mockLockProvider(defaultLock.withIsLocked(currentLock));

    await tester.pumpWidget(createMaterialApp(mockLockProvider));
    expect(find.byType(CupertinoSwitch), findsOneWidget);
    await tester.tap(find.byType(CupertinoSwitch));
    verify(mockLockProvider.setLockUnlockAction(any, !currentLock));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // expect(find.byType(LockIcon), findsNothing);
  });

  testWidgets('IsJammed notification bar not shown if not supported',
      (WidgetTester tester) async {
    final mockLockProvider = test.mockLockProvider(
      defaultLock.withIsLocked(true),
    );
    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.text(StringConstants.DEVICE_IS_JAMMED), findsNothing);
  });

  testWidgets(
      'IsJammed notification bar is not shown if supported but state is not jammed',
      (WidgetTester tester) async {
    final expectedIsJammedState = false;
    final mockLockProvider = test.mockLockProvider(defaultLock
        .withIsLocked(true)
        .withSupportsIsJammed(true)
        .withJammed(expectedIsJammedState));

    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.text(StringConstants.DEVICE_IS_JAMMED), findsNothing);
  });

  testWidgets(
      'IsJammed notification bar is shown if supported and state is jammed',
      (WidgetTester tester) async {
    final expectedIsJammedState = true;
    final mockLockProvider = test.mockLockProvider(defaultLock
        .withIsLocked(true)
        .withSupportsIsJammed(true)
        .withJammed(expectedIsJammedState));

    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.text(StringConstants.DEVICE_IS_JAMMED), findsOneWidget);
  });

  testWidgets(
      'IsJammed notification bar is shown and hides when x button is pressed.',
      (WidgetTester tester) async {
    final expectedIsJammedState = true;

    final mockLockProvider = test.mockLockProvider(defaultLock
        .withIsLocked(true)
        .withSupportsIsJammed(true)
        .withJammed(expectedIsJammedState));

    await tester.pumpWidget(createMaterialApp(mockLockProvider));

    expect(find.byType(NotificationBar), findsOneWidget);

    expect(
        find.byKey(Key(NotificationBar.NOTIFICATION_BAR_KEY)), findsOneWidget);

    expect(find.byIcon(BootstrapIcons.x), findsOneWidget);

    await tester.tap(find.byKey(Key(NotificationBar.NOTIFICATION_BAR_KEY)));

    await tester.pumpAndSettle();

    expect(find.byKey(Key(NotificationBar.NOTIFICATION_BAR_KEY)), findsNothing);
  });
}
