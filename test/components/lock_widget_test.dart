import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/components/lock_widget.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_widget_test.mocks.dart';

@GenerateMocks([LockProvider])
void main() {
  final mockProvider = MockLockProvider();
  final device = Device(
      'id',
      'name',
      'description',
      'manufacturerName',
      'model',
      null,
      GDateTime('value'),
      GDateTime('value'),
      [LockTrait('name', IsLocked(true))]);

  Widget getAppWithLockWidget() {
    return MaterialApp(
        home: ChangeNotifierProvider<LockProvider>.value(
      value: mockProvider,
      child: LockWidget(),
    ));
  }

  setUp(() {
    when(mockProvider.deviceDetail).thenReturn(device);
    when(mockProvider.setLockUnlockAction(any, any))
        .thenAnswer((_) => Future.value());
  });

  testWidgets('Circular progress indicator should be shown when loading',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(true);
    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byWidgetPredicate((w) => w is CircularProgressIndicator),
        findsOneWidget);
  });

  testWidgets('Lock Widget shows device name', (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    when(mockProvider.isLocked).thenReturn(false);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.text('name'), findsOneWidget);
  });

  testWidgets('Lock Widget shows Unlocked Icon when state is Unlocked',
      (WidgetTester tester) async {
    when(mockProvider.isLocked).thenReturn(false);
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byIcon(BootstrapIcons.unlock), findsOneWidget);
  });

  testWidgets('Lock Widget shows Locked Icon when state is Locked',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);

    when(mockProvider.isLocked).thenReturn(true);

    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byIcon(BootstrapIcons.lock), findsOneWidget);
  });

  testWidgets('Tapping on center Lock icon should run setLockUnlockAction',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(false);
    when(mockProvider.loadingAction).thenReturn(false);
    when(mockProvider.isLocked).thenReturn(true);
    await tester.pumpWidget(getAppWithLockWidget());

    await tester.tap(find.byIcon(BootstrapIcons.lock));

    verify(mockProvider.setLockUnlockAction(any, any)).called(1);
  });
}
