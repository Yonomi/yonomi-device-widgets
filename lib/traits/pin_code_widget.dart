import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PinCodeWidget extends StatelessWidget with ToastNotifications {
  final PinCodeProvider _pinCodeProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  PinCodeWidget(this._pinCodeProvider,
      {Color iconColor = WidgetStyleConstants.deviceIconColor,
      Color textColor = WidgetStyleConstants.darkTextColor,
      double iconSize = 60.0,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._iconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    if (_pinCodeProvider.isLoading) {
      return Center(
        child:
            SizedBox(child: CircularProgressIndicator(), height: 30, width: 30),
      );
    } else if (_pinCodeProvider.isInErrorState) {
      showToast(context, _pinCodeProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            Text(
              'PIN_CODE',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: _textColor),
            )
          ]),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Container(
              child: Center(
                child: SizedBox(
                  width: _iconSize,
                  height: _iconSize,
                  child: PinCodeIcon(size: _iconSize, color: _iconColor),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
