import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/power_slim_widget.dart';

MaterialApp createMaterialApp(PowerTraitProvider mockPowerProvider) {
  return MaterialApp(
    home: new Scaffold(
        body: Column(children: [PowerSlimWidget(mockPowerProvider)])),
  );
}

void main() {}
