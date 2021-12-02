import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/components/arc.dart';
import 'package:yonomi_device_widgets/providers/unknown_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class UnknownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UnknownProvider>(context, listen: true);

    return provider.loadingDetail
        ? Center(child: CircularProgressIndicator())
        : Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Row(children: <Widget>[
              Text(
                provider.deviceDetails.displayName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ]),
            SizedBox(
              height: 80,
            ),
            Center(
                child: Arc(
                    showThumb: false,
                    centerWidget: SizedBox(
                        width: WidgetStyleConstants.defaultDeviceWidgetSize,
                        height: WidgetStyleConstants.defaultDeviceWidgetSize,
                        child: GestureDetector(
                          child: getUnknownStateIcon(provider),
                          onTap: () {
                            provider.performAction(provider.deviceDetails.id);
                          },
                        )),
                    initialValue: 0,
                    maxValue: 1.0,
                    onFinalSetPoint: (double value) {}))
          ]);
  }

  Widget getUnknownStateIcon(UnknownProvider provider) {
    return (provider.loadingDetail || provider.loadingAction)
        ? Center(child: CircularProgressIndicator())
        : UnknownItemIcon(
            size: WidgetStyleConstants.defaultDeviceWidgetSize,
            color: WidgetStyleConstants.deviceDetailIconColorActive);
  }
}
