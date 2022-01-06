import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class DeviceSlimWidget extends StatelessWidget {
  final Widget leftIcon;
  final Text headerText;
  final Widget? rightIcon;
  final Widget? content;
  final Color? backgroundColor;
  final DeviceProvider? provider;

  DeviceSlimWidget(
      {this.provider,
      required this.leftIcon,
      required this.headerText,
      this.rightIcon,
      this.content,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((provider?.isLoading ?? false)) {
      return CircularProgressIndicator();
    } else if (provider?.isInErrorState ?? false) {
      return Icon(Icons.error);
    } else {
      return Column(
          children: <Widget>[(content != null ? _expandableTile() : _tile())]);
    }
  }

  Widget _expandableTile() {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(8.0),
      leading: (provider?.isPerformingAction ?? false)
          ? CircularProgressIndicator()
          : leftIcon,
      trailing: rightIcon,
      backgroundColor: backgroundColor,
      title: headerText,
      tilePadding: EdgeInsets.all(0.0),
      children: [content!],
      collapsedIconColor: WidgetStyleConstants.globalSuccessColor,
      iconColor: WidgetStyleConstants.deviceIconColor,
      key: key,
    );
  }

  Widget _tile() {
    return ListTile(
      tileColor: backgroundColor,
      leading: (provider?.isPerformingAction ?? false)
          ? CircularProgressIndicator()
          : leftIcon,
      trailing: rightIcon,
      title: headerText,
      horizontalTitleGap: 0.0,
      key: key,
    );
  }
}
