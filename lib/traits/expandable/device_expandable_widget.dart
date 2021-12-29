import 'package:flutter/material.dart';

class DeviceExpandableWidget extends StatelessWidget {
  final Icon leftIcon;

  final Text headerText;

  final Icon? rightIcon;

  final Widget? content;

  DeviceExpandableWidget(
      {required this.leftIcon,
      required this.headerText,
      this.rightIcon,
      this.content,
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
