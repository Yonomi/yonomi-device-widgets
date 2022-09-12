import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
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
                    builder: (context) =>
                        PinCodeListView(provider: pinCodeProvider),
                  )
                },
              );
            }),
            backgroundColor: backgroundColor,
            key: key);
}

class PinCodeListView extends StatelessWidget {
  final PinCodeProvider provider;

  const PinCodeListView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext rootContext) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (listViewCtx) => Builder(
            builder: (builderCtx) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.greenAccent,
                leading: Container(),
                middle: Text(StringConstants.PIN_CODES_LIST_SCREEN_TITLE),
                trailing: IconButton(
                  icon: const Icon(BootstrapIcons.plus_circle),
                  color: Colors.cyan,
                  onPressed: () => Navigator.of(builderCtx).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PinCodeDetailView(
                          provider,
                          backViewContext: listViewCtx),
                    ),
                  ),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Container(
                  color: Colors.amber,
                  child: (provider.getPinCodeCredentials?.isEmpty ?? true)
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(StringConstants.PIN_CODES_NO_PIN_CODES),
                        ))
                      : ListView(
                          shrinkWrap: true,
                          controller: ModalScrollController.of(builderCtx),
                          children: ListTile.divideTiles(
                            context: builderCtx,
                            tiles: _pinCodesToListTiles(
                                provider.getPinCodeCredentials!),
                          ).toList(),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<ListTile> _pinCodesToListTiles(
      List<PinCodeCredential> pinCodeCredentials) {
    return pinCodeCredentials
        .map(
          (pinCode) => ListTile(
            onTap: () => {print('TODO: Go to detail view. ')},
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

class PinCodeDetailView extends StatefulWidget {
  final PinCodeProvider provider;

  final BuildContext? backViewContext;

  const PinCodeDetailView(
    this.provider, {
    this.backViewContext,
    Key? key,
  }) : super(key: key);

  @override
  State<PinCodeDetailView> createState() => _PinCodeDetailViewState();
}

class _PinCodeDetailViewState extends State<PinCodeDetailView>
    with ToastNotifications {
  final _formKey = GlobalKey<FormState>();

  String _pinCode = '';
  String _pinCodeName = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text(StringConstants.PIN_CODES_NEW_PIN_CODE),
          trailing: IconButton(
              icon: const Icon(BootstrapIcons.check),
              color: Colors.green,
              onPressed: () async {
                await _savePinCode(widget.backViewContext ?? context);
                await Future.delayed(
                    const Duration(milliseconds: 250),
                    () =>
                        Navigator.of(widget.backViewContext ?? context).pop());
              }),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('PIN Code Settings'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: (value) {
                      this._pinCodeName = value;
                    },
                    validator: textValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: 'PIN Code Name',
                      helperText:
                          '{ x } character max (e.g. John Doe or babysitter)',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: (value) {
                      this._pinCode = value;
                    },
                    validator: textValidator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: 'PIN Code',
                      helperText:
                          '{ x } digit numeric code to use on the lock\'s keypad',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Future<void> _savePinCode(BuildContext ctx) async {
    print('saving pin code...');
    // await widget.provider.sendAddPinCode(this._pinCode, this._pinCodeName);
    await Future.delayed(Duration(milliseconds: 500));
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text('Saved changes')),
    );
  }
}
