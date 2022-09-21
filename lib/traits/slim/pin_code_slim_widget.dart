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
                                tiles: _pinCodesToListTiles(builderCtx,
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
      BuildContext context, List<PinCodeCredential> pinCodeCredentials) {
    return pinCodeCredentials
        .map(
          (pinCode) => Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PinCodeDetailView(
                        provider,
                        selectedPinCode: pinCode,
                        backViewContext: context,
                      ),
                    ),
                  );
                },
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
    bool newPinCode = widget.selectedPinCode == null;
    if (!newPinCode) {
      _pinCode = widget.selectedPinCode!.pinCode;
      _pinCodeName = widget.selectedPinCode!.name;
    }
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: ColorConstants.pinCodeBottomSheetDetailTitleBg,
          leading: Container(),
          middle: Text(newPinCode
              ? StringConstants.PIN_CODES_NEW_PIN_CODE
              : StringConstants.PIN_CODES_EDIT_PIN_CODE),
          trailing: IconButton(
              icon: const Icon(BootstrapIcons.check2),
              color: ColorConstants.pinCodeDetailCheckColor,
              onPressed: () async {
                await _savePinCode(context);
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
                        initialValue: widget.selectedPinCode?.name ?? '',
                        validator: (value) => _textInputValidator(
                            value,
                            widget.provider.nameLengthRange?.min,
                            widget.provider.nameLengthRange?.max),
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
                        initialValue: widget.selectedPinCode?.pinCode ?? '',
                        onChanged: (value) {
                          this._pinCode = value;
                        },
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) => _textInputValidator(
                            value,
                            widget.provider.pinCodeLengthRange?.min,
                            widget.provider.pinCodeLengthRange?.max),
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
                    if (!newPinCode)
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: OutlinedButton(
                            style:
                                WidgetStyleConstants.pinCodeDeleteButtonStyle,
                            onPressed: () {
                              print('TODO: Delete Pin Code.');
                            },
                            child: Text(
                              StringConstants.PIN_CODES_DELETE_BUTTON_TEXT,
                              style: WidgetStyleConstants
                                  .pinCodeDeleteButtonTextStyle,
                            ),
                          )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _textInputValidator(String? value, int? min, int? max) {
    if (value == null || value.isEmpty) {
      return StringConstants.PIN_CODES_PLEASE_ENTER_TEXT;
    }
    if (min != null && value.length < min) {
      return StringConstants.PIN_CODES_INPUT_VALID_RANGE_MIN;
    }
    if (max != null && value.length > max) {
      return StringConstants.PIN_CODES_INPUT_VALID_RANGE_MAX;
    }
    return null;
  }

  Future<void> _savePinCode(BuildContext ctx) async {
    if (_formKey.currentState!.validate()) {
      bool newPinCode = widget.selectedPinCode == null;
      await widget.provider.sendCreatePinCode(this._pinCode, this._pinCodeName);
      String toastMsg = (newPinCode) ? 'Creating new PIN' : 'Saving changes';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(toastMsg),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 250),
          () => Navigator.of(widget.backViewContext ?? context).pop());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Invalid form'),
        ),
      );
    }
  }
}
