import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/unknown_item_icon.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class UnknownWidget extends StatelessWidget {
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;
  late final String _name;

  UnknownWidget(
      {String? name,
      Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.darkTextColor,
      double iconSize = 100.0,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._iconSize = iconSize;
    this._name = name ?? 'UNKNOWN';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              _name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: _textColor),
              textAlign: TextAlign.left,
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
            child: SizedBox(
              width: _iconSize,
              height: _iconSize,
              child: UnknownItemIcon(
                size: _iconSize,
                color: _iconColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]);
  }
}
