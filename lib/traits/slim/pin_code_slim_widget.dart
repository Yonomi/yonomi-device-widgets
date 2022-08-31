import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';

class PinCodeSlimWidget extends BaseSlimWidget {
  PinCodeSlimWidget(PinCodeProvider pinCodeProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: pinCodeProvider,
            leftIcon: (pinCodeProvider.isBusy)
                ? SizedBox(
                    child: CircularProgressIndicator(), height: 20, width: 20)
                : PinCodeIcon(),
            headerText: const Text('Manage PIN Codes',
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            rightIcon: IconButton(
                icon: const Icon(BootstrapIcons.chevron_bar_right),
                onPressed: () => null
                // TODO: navigate to Manage Pin Codes screen
                ),
            backgroundColor: backgroundColor,
            key: key);
}
