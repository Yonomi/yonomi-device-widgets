import 'package:flutter/material.dart';

class DeviceSlimWidget extends StatelessWidget {
  final Icon leftIcon;
  final Text headerText;
  final Widget? rightIcon;
  final Widget? content;
  final Color? backgroundColor;

  DeviceSlimWidget(
      {required this.leftIcon,
      required this.headerText,
      this.rightIcon,
      this.content,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[(content != null ? _expandableTile() : _tile())]);
  }

  Widget _expandableTile() {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(8.0),
      leading: leftIcon,
      trailing: rightIcon,
      backgroundColor: backgroundColor,
      title: headerText,
      tilePadding: EdgeInsets.all(0.0),
      children: [content!],
      key: key,
    );
  }

  Widget _tile() {
    return ListTile(
      tileColor: backgroundColor,
      leading: leftIcon,
      trailing: rightIcon,
      title: headerText,
      horizontalTitleGap: 0.0,
      key: key,
    );
  }
}
