import 'package:flutter/material.dart';

class DeviceExpandWidget extends StatelessWidget {
  final Icon leftIcon;

  final Text headerText;

  final Icon? rightIcon;

  final Widget? content;

  final Color? backgroundColor;

  DeviceExpandWidget(
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
      trailing: rightIcon,
      backgroundColor: backgroundColor,
      title: Row(children: [
        leftIcon,
        Padding(padding: EdgeInsets.all(8.0)),
        headerText
      ]),
      children: <Widget>[
        content ?? Padding(padding: EdgeInsets.zero),
      ],
      key: key,
    );
  }

  Widget _tile() {
    return ListTile(
      tileColor: backgroundColor,
      trailing: rightIcon,
      title: Row(children: [
        leftIcon,
        Padding(padding: EdgeInsets.all(8.0)),
        headerText
      ]),
      key: key,
    );
  }
}
