import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/color_constants.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/src/repository/traits/pin_code_repository.dart';

class PinCodeSlimWidget extends BaseSlimWidget {
  PinCodeSlimWidget(PinCodeProvider pinCodeProvider,
      {Color? backgroundColor, Key? key})
      : super(
            provider: pinCodeProvider,
            leftIcon: (pinCodeProvider.isLoading)
                ? Center(
                    child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 30,
                        width: 30),
                  )
                : PinCodeIcon(size: 30.0),
            headerText: const Text(StringConstants.PIN_CODES_MANAGE_PIN_CODES,
                style: TextStyle(
                    fontSize: 20, color: WidgetStyleConstants.darkTextColor)),
            rightIcon: Builder(
                builder: (context) => IconButton(
                      icon: const Icon(
                        BootstrapIcons.chevron_right,
                        color: Colors.black,
                      ),
                      onPressed: () => {
                        showCupertinoModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          expand: true,
                          enableDrag: true,
                          builder: (context) =>
                              PinCodeListView(provider: pinCodeProvider),
                        )
                      },
                    )),
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
                backgroundColor: ColorConstants.pinCodeBottomSheetListTitleBg,
                leading: Container(),
                middle: Text(provider.displayName),
                trailing: IconButton(
                  icon: const Icon(BootstrapIcons.plus_circle),
                  color: Colors.cyan,
                  onPressed: () => Navigator.of(builderCtx).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PinCodeDetailView(
                        provider,
                        backViewContext: builderCtx,
                      ),
                    ),
                  ),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Container(
                  color: ColorConstants.pinCodeListBodyBg,
                  child: (provider.getPinCodeCredentials?.isEmpty ?? true)
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(StringConstants.PIN_CODES_NO_PIN_CODES,
                                style:
                                    WidgetStyleConstants.pinCodeListTitleStyle),
                          ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16.0),
                          child: Column(children: [
                            Text(
                              StringConstants.PIN_CODES_LIST_SCREEN_TITLE,
                              style: WidgetStyleConstants.pinCodeListTitleStyle,
                            ),
                            ListView(
                              shrinkWrap: true,
                              controller: ModalScrollController.of(builderCtx),
                              children: ListTile.divideTiles(
                                context: builderCtx,
                                tiles: _pinCodesToListTiles(
                                    provider.getPinCodeCredentials!),
                              ).toList(),
                            ),
                          ]),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Column> _pinCodesToListTiles(
      List<PinCodeCredential> pinCodeCredentials) {
    return pinCodeCredentials
        .map(
          (pinCode) => Column(
            children: [
              ListTile(
                onTap: () => {print('TODO: Go to detail view. ')},
                title: Text(
                  pinCode.name,
                  style: WidgetStyleConstants.pinCodeListItemStyle,
                ),
                trailing: const Icon(
                  BootstrapIcons.chevron_right,
                  color: Colors.black,
                ),
              ),
              Container(height: 5, color: ColorConstants.pinCodeListBodyBg),
            ],
          ),
        )
        .toList();
  }
}

class PinCodeDetailView extends StatefulWidget {
  static const int DEFAULT_MAX_PIN_CODE_LENGTH = 50;
  static const int DEFAULT_MAX_PIN_CODE_NAME_LENGTH = 20;

  final PinCodeProvider provider;
  final BuildContext? backViewContext;

  final PinCodeCredential? selectedPinCode;

  const PinCodeDetailView(
    this.provider, {
    this.selectedPinCode,
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
          backgroundColor: ColorConstants.pinCodeBottomSheetDetailTitleBg,
          leading: Container(),
          middle: Text(StringConstants.PIN_CODES_NEW_PIN_CODE),
          trailing: IconButton(
              icon: const Icon(BootstrapIcons.check2),
              color: ColorConstants.pinCodeDetailCheckColor,
              onPressed: () async {
                await _savePinCode(widget.backViewContext ?? context);
                await Future.delayed(
                    const Duration(milliseconds: 250),
                    () =>
                        Navigator.of(widget.backViewContext ?? context).pop());
              }),
        ),
        child: SafeArea(
          child: Container(
            color: ColorConstants.pinCodeDetailBodyBg,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      StringConstants.PIN_CODES_PIN_CODE_SETTINGS,
                      style: WidgetStyleConstants.pinCodeDetailTitleStyle,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        onChanged: (value) {
                          this._pinCodeName = value;
                        },
                        validator: textValidator,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldLabelText),
                          hintStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldHintText),
                          helperStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldHelperText),
                          labelText: StringConstants.PIN_CODES_PIN_CODE_NAME,
                          helperText:
                              '${widget.provider.nameLengthRange?.max ?? PinCodeDetailView.DEFAULT_MAX_PIN_CODE_NAME_LENGTH} character max (e.g. John Doe or babysitter)',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        onChanged: (value) {
                          this._pinCode = value;
                        },
                        validator: textValidator,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldLabelText),
                          hintStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldHintText),
                          helperStyle: TextStyle(
                              color: ColorConstants
                                  .pinCodeDetailTextFieldHelperText),
                          labelText: StringConstants.PIN_CODES_PIN_CODE,
                          helperText:
                              '${widget.provider.pinCodeLengthRange?.max ?? PinCodeDetailView.DEFAULT_MAX_PIN_CODE_LENGTH} digit numeric code to use on the lock\'s keypad',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.PIN_CODES_PLEASE_ENTER_TEXT;
    }
    return null;
  }

  Future<void> _savePinCode(BuildContext ctx) async {
    print('Saving pin code...');
    await widget.provider.sendCreatePinCode(this._pinCode, this._pinCodeName);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(StringConstants.PIN_CODES_SAVED_CHANGES)),
    );
  }
}