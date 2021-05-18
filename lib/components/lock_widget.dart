import 'package:device_widgets/providers/lock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lockProvider = Provider.of<LockProvider>(context, listen: true);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: <Widget>[
          Text(
            lockProvider?.deviceDetail?.displayName ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      SizedBox(
        height: 80,
      ),
      Center(
        child: Text("Lock component will go here"),
      ),
    ]);
  }
}
