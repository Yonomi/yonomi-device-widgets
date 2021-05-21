import 'package:device_widgets/components/lock_widget.dart';
import 'package:device_widgets/providers/lock_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockLockProvider extends Mock implements LockProvider {}

MockLockProvider mockProvider = MockLockProvider();

Widget getAppWithLockWidget() {
  return MaterialApp(
      home: ChangeNotifierProvider<LockProvider>.value(
          value: mockProvider, child: LockWidget()));
}

void main() {
  testWidgets('Circular progress indicator should be shown when loading',
      (WidgetTester tester) async {
    when(mockProvider.loadingDetail).thenReturn(true);
    await tester.pumpWidget(getAppWithLockWidget());

    expect(find.byWidgetPredicate((w) => w is CircularProgressIndicator),
        findsOneWidget);
  });
}
