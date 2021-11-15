import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/components/lock_widget.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

class MockLockProvider extends Mock implements LockProvider {}

class MockDevice extends Mock implements Device {}

MockDevice mockDeviceDetail = MockDevice();
MockLockProvider mockProvider = MockLockProvider();

Widget getAppWithLockWidget() {
  return MaterialApp(
      home: ChangeNotifierProvider<LockProvider>.value(
    value: mockProvider,
    child: LockWidget(),
  ));
}

void main() {
  setUp(() {
    when(mockProvider.deviceDetail).thenReturn(mockDeviceDetail);
  });

  testWidgets('Circular progress indicator should be shown when loading',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(true);
    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byWidgetPredicate((w) => w is CircularProgressIndicator),
        findsOneWidget);
  });

  testWidgets('Lock Widget shows device name', (WidgetTester tester) async {
    when(mockDeviceDetail.displayName).thenReturn("LockDeviceUnderTest");
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    when(mockProvider.isLocked).thenReturn(false);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.text("LockDeviceUnderTest"), findsOneWidget);
  });

  testWidgets('Lock Widget shows Unlocked Icon when state is Unlocked',
      (WidgetTester tester) async {
    when(mockProvider.isLocked).thenReturn(false);
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byIcon(Icons.lock_open), findsOneWidget);
  });

  testWidgets('Lock Widget shows Locked Icon when state is Locked',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    when(mockProvider.isLocked).thenReturn(true);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byIcon(Icons.lock), findsOneWidget);
  });

  testWidgets('Tapping on center Lock icon should run setLockUnlockAction',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);
    when(mockProvider.isLocked).thenReturn(true);
    await tester.pumpWidget(getAppWithLockWidget());

    await tester.tap(find.byIcon(Icons.lock));

    verify(mockProvider.setLockUnlockAction(any, any!)).called(1);
  });
}
