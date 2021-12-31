import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/lock_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/lock_slim_widget.dart';

MaterialApp createMaterialApp(LockProvider mockLockProvider) {
  return MaterialApp(
    home: Column(children: [LockSlimWidget(mockLockProvider)]),
  );
}

void main() {}
