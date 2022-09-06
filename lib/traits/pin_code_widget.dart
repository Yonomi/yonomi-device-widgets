import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PinCodeWidget extends StatelessWidget with ToastNotifications {
  final PinCodeProvider _pinCodeProvider;
  late final Color _iconColor;
  late final Color _textColor;
  late final double _iconSize;

  PinCodeWidget(this._pinCodeProvider,
      {Color iconColor = WidgetStyleConstants.deviceDetailIconColorActive,
      Color textColor = WidgetStyleConstants.darkTextColor,
      double iconSize = 100.0,
      Key? key})
      : super(key: key) {
    this._iconColor = iconColor;
    this._textColor = textColor;
    this._iconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    if (_pinCodeProvider.isBusy) {
      return SizedBox(
          child: CircularProgressIndicator(), height: 20, width: 20);
    } else if (_pinCodeProvider.isInErrorState) {
      showToast(context, _pinCodeProvider.getErrorMessage);
      return Icon(Icons.error);
    } else {
      return Text("Placeholder: Pin Code Widget",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: _textColor));
    }
  }
}
