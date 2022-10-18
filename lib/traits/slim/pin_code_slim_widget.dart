import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:yonomi_device_widgets/assets/traits/pin_code_icon.dart';
import 'package:yonomi_device_widgets/mixins/toast_notifications.dart';
import 'package:yonomi_device_widgets/providers/pin_code_provider.dart';
import 'package:yonomi_device_widgets/traits/slim/base_slim_widget.dart';
import 'package:yonomi_device_widgets/ui/color_constants.dart';
import 'package:yonomi_device_widgets/ui/string_constants.dart';
import 'package:yonomi_device_widgets/ui/widget_style_constants.dart';
import 'package:yonomi_platform_sdk/src/repository/traits/pin_code_repository.dart';

class PinCodeSlimWidget extends BaseSlimWidget with ToastNotifications {
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

class PinCodeListView extends StatelessWidget with ToastNotifications {
  final PinCodeProvider provider;

  const PinCodeListView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext rootContext) {
    return Material(
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (listViewCtx) => Builder(
              builder: (builderCtx) =>
                  ChangeNotifierProvider<PinCodeProvider>.value(
                value: this.provider,
                child: Consumer<PinCodeProvider>(
                    builder: (builderCtx, provider, child) =>
                        CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(
                            backgroundColor:
                                ColorConstants.pinCodeBottomSheetListTitleBg,
                            leading: Container(),
                            middle: Text(provider.displayName),
                            trailing: IconButton(
                                icon: const Icon(BootstrapIcons.plus_circle),
                                iconSize: 24.0,
                                color: ColorConstants.pinCodeNewPinCodeButton,
                                onPressed: () async {
                                  String? result =
                                      await Navigator.of(builderCtx).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PinCodeDetailView(provider),
                                    ),
                                  );

                                  if (result != null)
                                    showToast(builderCtx, result);
                                }),
                          ),
                          child: SafeArea(
                            bottom: false,
                            child: Container(
                              color: ColorConstants.pinCodeListBodyBg,
                              child: (provider.getPinCodeCredentials?.isEmpty ??
                                      true)
                                  ? Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          StringConstants
                                              .PIN_CODES_NO_PIN_CODES,
                                          style: WidgetStyleConstants
                                              .pinCodeListTitleStyle,
                                        ),
                                      ))
                                  : Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 16.0),
                                          child: Column(children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  StringConstants
                                                      .PIN_CODES_LIST_SCREEN_TITLE,
                                                  style: WidgetStyleConstants
                                                      .pinCodeListTitleStyle,
                                                ),
                                              ),
                                            ),
                                            ListView(
                                              shrinkWrap: true,
                                              controller:
                                                  ModalScrollController.of(
                                                      builderCtx),
                                              children: ListTile.divideTiles(
                                                context: builderCtx,
                                                tiles: _pinCodesToListTiles(
                                                    builderCtx,
                                                    provider
                                                        .getPinCodeCredentials!),
                                              ).toList(),
                                            ),
                                          ]),
                                        ),
                                        Visibility(
                                          visible: provider.isBusy,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Padding> _pinCodesToListTiles(
      BuildContext topContext, List<PinCodeCredential> pinCodeCredentials) {
    return pinCodeCredentials
        .map((pinCode) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(topContext).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PinCodeDetailView(
                          provider,
                          selectedPinCode: pinCode,
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
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ))
        .toList();
  }
}

class PinCodeDetailView extends StatefulWidget {
  static const int DEFAULT_MAX_PIN_CODE_LENGTH = 50;
  static const int DEFAULT_MAX_PIN_CODE_NAME_LENGTH = 20;

  final PinCodeProvider provider;

  final PinCodeCredential? selectedPinCode;

  static const String PIN_CODE_PIN_CODE_FIELD = 'pin_code_pin_code_field';
  static const String PIN_CODE_PIN_CODE_NAME_FIELD =
      'pin_code_pin_code_name_field';

  const PinCodeDetailView(
    this.provider, {
    this.selectedPinCode,
    Key? key,
  }) : super(key: key);

  @override
  State<PinCodeDetailView> createState() => _PinCodeDetailViewState();
}

class _PinCodeDetailViewState extends State<PinCodeDetailView>
    with ToastNotifications {
  final _formKey = GlobalKey<FormState>();

  bool showPasswordField = false;
  bool newPinCode = true;

  String _pinCode = '';
  String _pinCodeName = '';

  @override
  void initState() {
    super.initState();
    newPinCode = widget.selectedPinCode == null;
    if (!newPinCode) {
      _pinCode = widget.selectedPinCode!.pinCode;
      _pinCodeName = widget.selectedPinCode!.name;
    }
  }

  @override
  Widget build(BuildContext rootContext) {
    return Material(
      child: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: ColorConstants.pinCodeBottomSheetDetailTitleBg,
            middle: Text(newPinCode
                ? StringConstants.PIN_CODES_NEW_PIN_CODE
                : widget.selectedPinCode!.name),
            trailing: IconButton(
              icon: const Icon(BootstrapIcons.check2),
              iconSize: 24.0,
              color: ColorConstants.pinCodeDetailCheckColor,
              onPressed: () async => await _savePinCode(rootContext),
            ),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            StringConstants.PIN_CODES_PIN_CODE_SETTINGS,
                            style: WidgetStyleConstants.pinCodeDetailTitleStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextFormField(
                          key: Key(
                              PinCodeDetailView.PIN_CODE_PIN_CODE_NAME_FIELD),
                          onChanged: (value) => this._pinCodeName = value,
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
                                '${widget.provider.nameLengthRange?.max ?? PinCodeDetailView.DEFAULT_MAX_PIN_CODE_NAME_LENGTH} character max (e.g. John D or Babysitter)',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextFormField(
                          key: Key(PinCodeDetailView.PIN_CODE_PIN_CODE_FIELD),
                          initialValue: widget.selectedPinCode?.pinCode ?? '',
                          onChanged: (value) => this._pinCode = value,
                          obscureText: !this.showPasswordField,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                this.showPasswordField
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(rootContext).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() => this.showPasswordField =
                                    !this.showPasswordField);
                              },
                            ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: OutlinedButton(
                              style:
                                  WidgetStyleConstants.pinCodeDeleteButtonStyle,
                              onPressed: () {
                                showDialog(
                                  context: rootContext,
                                  builder: (context) => AlertDialog(
                                    title: Text(StringConstants
                                        .PIN_CODE_DELETE_ALERT_TITLE),
                                    content: Text(StringConstants
                                        .PIN_CODE_DELETE_ALERT_MSG_TEXT),
                                    actions: [
                                      TextButton(
                                        child: Text(StringConstants
                                            .PIN_CODE_DELETE_ALERT_CANCEL),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                        child: Text(StringConstants
                                            .PIN_CODE_DELETE_ALERT_OK),
                                        onPressed: () async {
                                          Navigator.of(context).pop();

                                          Navigator.of(rootContext)
                                              .pop('Deleting PIN Code');

                                          await widget.provider
                                              .sendDeletePinCode(
                                            widget.selectedPinCode!.pinCode,
                                            widget.selectedPinCode!.name,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
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
      ),
    );
  }

  String? _textInputValidator(String? value, int? min, int? max) {
    String? errorMessage;
    if (value == null || value.isEmpty) {
      errorMessage = StringConstants.PIN_CODES_PLEASE_ENTER_TEXT;
    } else {
      if (min != null && value.length < min) {
        errorMessage = StringConstants.PIN_CODES_INPUT_VALID_RANGE_MIN;
      }
      if (max != null && value.length > max) {
        errorMessage = StringConstants.PIN_CODES_INPUT_VALID_RANGE_MAX;
      }
    }
    return errorMessage;
  }

  Future<void> _savePinCode(BuildContext ctx) async {
    if (_formKey.currentState!.validate()) {
      bool newPinCode = widget.selectedPinCode == null;
      Navigator.of(ctx)
          .pop((newPinCode) ? 'Creating new PIN' : 'Saving changes');

      newPinCode
          ? await widget.provider.sendCreatePinCode(
              this._pinCode,
              this._pinCodeName,
            )
          : await widget.provider.sendUpdatePinCode(
              this._pinCode,
              this._pinCodeName,
            );
    } else {
      showToast(
        context,
        StringConstants.PIN_CODE_FORM_ERROR,
        behavior: SnackBarBehavior.floating,
      );
    }
  }
}
