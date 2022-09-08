import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/src/repository/traits/pin_code_repository.dart';

class PinCodeSlimWidget extends BaseSlimWidget {
  PinCodeSlimWidget(PinCodeProvider pinCodeProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: pinCodeProvider,
            leftIcon: (pinCodeProvider.isBusy)
                ? SizedBox(
                    child: CircularProgressIndicator(), height: 20, width: 20)
                : PinCodeIcon(size: 30.0),
            headerText: const Text(StringConstants.PIN_CODES_MANAGE_PIN_CODES,
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            rightIcon: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(
                  BootstrapIcons.chevron_right,
                  color: Colors.black,
                ),
                onPressed: () => {
                  showCupertinoModalBottomSheet(
                    context: context,
                    expand: true,
                    enableDrag: true,
                    //TODO: Uncomment when ready:
                    // builder: (context) => PinCodeListView(pinCodeProvider.getPinCodeCredentials),
                    builder: (context) => PinCodeListView([]),
                  )
                },
              );
            }),
            backgroundColor: backgroundColor,
            key: key);
}

class PinCodeListView extends StatelessWidget {
  final List<PinCodeCredential>? pinCodeCredentials;

  const PinCodeListView(
    this.pinCodeCredentials, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text(StringConstants.PIN_CODES_PIN_CODE_LIST_SCREEN_TITLE),
          trailing: IconButton(
            icon: const Icon(BootstrapIcons.plus_circle),
            color: Colors.cyan,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PinCodeDetailView(),
            )),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              child: (pinCodeCredentials != null && pinCodeCredentials!.isEmpty)
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(StringConstants.PIN_CODES_NO_PIN_CODES),
                    ))
                  : ListView(
                      shrinkWrap: true,
                      controller: ModalScrollController.of(context),
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: _toListTiles(pinCodeCredentials!),
                      ).toList(),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  List<ListTile> _toListTiles(List<PinCodeCredential> pinCodeCredentials) {
    return pinCodeCredentials
        .map(
          (pinCode) => ListTile(
            title: Text(pinCode.name),
            trailing: const Icon(
              BootstrapIcons.chevron_right,
              color: Colors.black,
            ),
          ),
        )
        .toList();
  }
}

class PinCodeDetailView extends StatelessWidget {
  const PinCodeDetailView({
    Key? key,
    pincode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(StringConstants.PIN_CODES_NEW_PIN_CODE),
      ),
      child: Container(),
    );
  }
}
