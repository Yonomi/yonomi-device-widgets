import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yonomi_device_widgets/providers/power_trait_provider.dart';

class PowerWidget extends StatelessWidget {
  PowerTraitProvider powerTraitProvider;

  PowerWidget(@required this.powerTraitProvider);

  @override
  Widget build(BuildContext context) {
    return powerTraitProvider.isBusy
        ? CircularProgressIndicator()
        : Text("PowerWidget");
  }
}
