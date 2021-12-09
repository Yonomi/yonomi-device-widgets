import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/lock.dart';
import 'package:yonomi_platform_sdk/third_party/yonomi_graphql_schema/schema.docs.schema.gql.dart';
import 'package:yonomi_platform_sdk/yonomi-sdk.dart';

import 'lock_test.mocks.dart';

MaterialApp createMaterialApp(
    LockProvider mockLockProvider, Request req, String deviceId) {
  return MaterialApp(
    home: Column(children: [
      ChangeNotifierProvider<LockProvider>.value(
        value: mockLockProvider,
        child: LockWidget(mockLockProvider),
      ),
    ]),
  );
}

Device _getStubbedDevice() {
  return Device(
    "",
    "",
    "",
    "",
    "",
    "",
    GDateTime('value'),
    GDateTime('value'),
    [],
  );
}

@GenerateMocks([LockProvider])
void main() {
  group("Lock Widget", () {
    testWidgets('when loading, it should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      LockProvider mockLockProvider = MockLockProvider();
      when(mockLockProvider.isLocked).thenReturn(false);
      when(mockLockProvider.loadingDetail).thenReturn(true);
      when(mockLockProvider.loadingAction).thenReturn(false);

      await tester
          .pumpWidget(createMaterialApp(mockLockProvider, Request('', {}), ""));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'when performing an action, it should show CircularProgressIndicator ',
        (WidgetTester tester) async {
      LockProvider mockLockProvider = MockLockProvider();
      when(mockLockProvider.isLocked).thenReturn(false);
      when(mockLockProvider.loadingDetail).thenReturn(false);
      when(mockLockProvider.loadingAction).thenReturn(true);

      await tester
          .pumpWidget(createMaterialApp(mockLockProvider, Request('', {}), ""));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('when unlocked, should show Bootstraps.unlock icon',
        (WidgetTester tester) async {
      LockProvider mockLockProvider = MockLockProvider();
      when(mockLockProvider.isLocked).thenReturn(false);
      when(mockLockProvider.loadingDetail).thenReturn(false);
      when(mockLockProvider.loadingAction).thenReturn(false);

      await tester
          .pumpWidget(createMaterialApp(mockLockProvider, Request('', {}), ""));

      expect(find.byIcon(BootstrapIcons.unlock), findsOneWidget);
    });

    testWidgets('when locked, should show Bootstraps.lock icon',
        (WidgetTester tester) async {
      LockProvider mockLockProvider = MockLockProvider();
      when(mockLockProvider.isLocked).thenReturn(true);
      when(mockLockProvider.loadingDetail).thenReturn(false);
      when(mockLockProvider.loadingAction).thenReturn(false);

      await tester
          .pumpWidget(createMaterialApp(mockLockProvider, Request('', {}), ""));

      expect(find.byIcon(BootstrapIcons.lock), findsOneWidget);
    });

    testWidgets('when tapped, should run setLockUnlockAction',
        (WidgetTester tester) async {
      LockProvider mockLockProvider = MockLockProvider();
      when(mockLockProvider.deviceDetail).thenReturn(_getStubbedDevice());
      when(mockLockProvider.setLockUnlockAction("", true))
          .thenAnswer((_) async => null);
      when(mockLockProvider.isLocked).thenReturn(false);
      when(mockLockProvider.loadingDetail).thenReturn(false);
      when(mockLockProvider.loadingAction).thenReturn(false);

      await tester
          .pumpWidget(createMaterialApp(mockLockProvider, Request('', {}), ""));

      await tester.tap(find.byType(CupertinoSwitch));

      await tester.pumpAndSettle();

      verify(mockLockProvider.setLockUnlockAction("", true)).called(1);
    });
  });
}
