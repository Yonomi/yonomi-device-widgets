import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/lock_item_icon.dart';

Widget createIconWidget(bool isLocked) {
  return MaterialApp(
    home: Scaffold(body: Container(child: LockIcon(isLocked))),
  );
}

void main() {
  testWidgets('should render correct Lock trait icon when unlocked',
      (WidgetTester tester) async {
    await tester.pumpWidget(createIconWidget(false));
    expect(find.byIcon(BootstrapIcons.unlock), findsOneWidget);
  });

  testWidgets('should render correct Lock trait icon when locked',
      (WidgetTester tester) async {
    await tester.pumpWidget(createIconWidget(true));
    expect(find.byIcon(BootstrapIcons.lock), findsOneWidget);
  });
}
