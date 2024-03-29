import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/device_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

typedef CreateWidget = Widget Function(BuildContext context);

class BaseSlimWidget extends StatelessWidget with ToastNotifications {
  final Widget leftIcon;
  final Text headerText;
  final Widget? rightIcon;
  final CreateWidget? createContent;
  final Color? backgroundColor;
  final DeviceProvider? provider;

  BaseSlimWidget(
      {this.provider,
      required this.leftIcon,
      required this.headerText,
      this.rightIcon,
      this.createContent,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((provider?.isLoading ?? false)) {
      return ListTile(
        tileColor: backgroundColor,
        title:
            SizedBox(child: CircularProgressIndicator(), height: 20, width: 20),
        horizontalTitleGap: 16.0,
        key: key,
      );
    } else if (provider?.isInErrorState ?? false) {
      showToast(
          context, provider?.getErrorMessage ?? 'An unknown error occurred');
      return ListTile(
        tileColor: backgroundColor,
        title: Icon(Icons.error, size: 20),
        horizontalTitleGap: 16.0,
        key: key,
      );
    } else {
      return Column(
          children: <Widget>[
        (createContent != null ? _expandableTile(context) : _tile())
      ]);
    }
  }

  Widget _expandableTile(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(8.0),
      leading: (provider?.isPerformingAction ?? false)
          ? SizedBox(child: CircularProgressIndicator(), height: 20, width: 20)
          : leftIcon,
      trailing: rightIcon,
      backgroundColor: backgroundColor,
      title: headerText,
      tilePadding: EdgeInsets.all(0.0),
      children: [createContent!.call(context)],
      collapsedIconColor: WidgetStyleConstants.globalSuccessColor,
      iconColor: WidgetStyleConstants.deviceIconColor,
      key: key,
    );
  }

  Widget _tile() {
    return ListTile(
      tileColor: backgroundColor,
      leading: (provider?.isPerformingAction ?? false)
          ? SizedBox(child: CircularProgressIndicator(), height: 20, width: 20)
          : leftIcon,
      trailing: rightIcon,
      title: headerText,
      horizontalTitleGap: 16.0,
      contentPadding: EdgeInsets.all(0),
      key: key,
    );
  }
}
