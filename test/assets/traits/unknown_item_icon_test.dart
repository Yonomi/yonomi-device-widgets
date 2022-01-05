import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';

Widget createIconWidget() {
  return MaterialApp(
    home: Scaffold(body: Container(child: UnknownItemIcon())),
  );
}

void main() {
  testWidgets('should render correct Unknown trait icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(createIconWidget());
    expect(find.byIcon(BootstrapIcons.box), findsOneWidget);
  });
}
