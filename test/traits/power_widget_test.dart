import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/power_widget.dart';

import 'power_widget_test.mocks.dart';

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: Column(children: [PowerWidget(mockPowerProvider)]),
  );
}

@GenerateMocks([PowerTraitProvider])
void main() {
  testWidgets('When loading, should show CircularProgressIndicator ',
      (WidgetTester tester) async {
    final mockPowerTraitProvider = MockPowerTraitProvider();
    when(mockPowerTraitProvider.isBusy).thenReturn(true);
    // when(mockPowerTraitProvider.loadingAction).thenReturn(false);
    await tester.pumpWidget(createMaterialApp(mockPowerTraitProvider));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsNothing);
  });
}
