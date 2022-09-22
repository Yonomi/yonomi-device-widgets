import 'package:flutter/material.dart';
import 'package:yonomi_device_widgets/ui/color_constants.dart';

class WidgetStyleConstants {
  WidgetStyleConstants._();

  static const Color globalWarningColor = Color(0xFFF19953);

  static const Color globalSuccessColor = Color(0xFF01A299);

  static const Color modesButtonUnpressedColor = Color(0xFFDFE0E4);

  static const Color modesButtonPressedColor = Color(0xFF5D657A);

  static const Color deviceIconColor = Color(0xFF1E1F29);

  static const Color deviceDetailIconColorInactive = Color(0xFFDFE0E4);

  static const Color deviceDetailIconColorActive = Color(0xFF5D657A);

  static const Color textColorState = Color(0xFF00B3A6);

  static const Color darkTextColor = Color(0xFF25262F);

  static TextStyle deviceItemTextPrimaryState = TextStyle(
      fontWeight: FontWeight.w900,
      color: WidgetStyleConstants.textColorState,
      fontSize: 19.0);

  static const Color defaultArcColor = Color(0xff63aa65);

  static const Color defaultBorderColor = Colors.black;

  static const double defaultBorderWidth = 3.0;

  static final BorderRadius defaultCircularBorderRadius =
      BorderRadius.circular(100);

  static const double defaultDeviceIconSize = 60.0;

  static const double defaultDeviceWidgetSize = 175.0;

  static const Color traitDetailSwitchPressedColor = Color(0xFF01A299);

  static const int batteryLowMax = 15;

  static const int batteryFullMin = 75;

  static const Color jammedStateTextColor = Colors.white;

  static ButtonStyle pinCodeDeleteButtonStyle = OutlinedButton.styleFrom(
    minimumSize: Size.fromHeight(60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    side: BorderSide(color: ColorConstants.PIN_CODE_DELETE_BUTTON_RED),
  );

  static const TextStyle pinCodeDeleteButtonTextStyle = TextStyle(
      color: ColorConstants.PIN_CODE_DELETE_BUTTON_TEXT_RED,
      fontWeight: FontWeight.w400,
      fontSize: 16.0);

  static const Color pinCodeListTitleColor = Color(0xFF5E6578);

  static const Color pinCodeListItemColor = Color(0xFF4DA49F);

  static const TextStyle pinCodeListItemStyle = TextStyle(
      color: WidgetStyleConstants.pinCodeListItemColor, fontSize: 16.0);

  static const TextStyle pinCodeListTitleStyle = TextStyle(
      color: WidgetStyleConstants.pinCodeListTitleColor,
      fontWeight: FontWeight.w900,
      fontSize: 18.0);

  static const TextStyle pinCodeDetailTitleStyle = TextStyle(
      color: WidgetStyleConstants.pinCodeListTitleColor,
      fontWeight: FontWeight.w900,
      fontSize: 16.0);
}
