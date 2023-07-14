import 'package:flutter/material.dart';
import 'package:tembo_client/src/constants/colors.dart';
import 'package:tembo_client/src/constants/constants.dart';

import 'package:tembo_client/src/styles/button_styles.dart';
import 'package:tembo_client/src/styles/date_picker_decoration.dart';
import 'package:tembo_client/src/styles/text_field_decoration.dart';

class TemboThemeData {
  final TextStyle pageTitleStyle;
  final TemboButtonStyle selectedOptionButtonStyle;
  final TemboButtonStyle unselecetdOptionButtonStyle;
  final TemboButtonStyle bottomNavBarButtonStyle;

  final TemboDatePickerDecoration datePickerDecoration;
  final TemboTextFieldDecoration textFieldDecoration;

  TemboThemeData({
    this.pageTitleStyle = _pageTitleStyle,
    this.selectedOptionButtonStyle = _optionButtonStyle,
    this.unselecetdOptionButtonStyle = _unselectedOptionButtonStyle,
    this.datePickerDecoration = _datePickerStyle,
    this.textFieldDecoration = _textFieldDecoration,
    this.bottomNavBarButtonStyle = _bottomNavBarStyle,
  });
}

const _pageTitleStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: kFontFamily,
  color: Color(0xffAAC0CE),
);

const _optionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: Color(0xFFEEEEEE),
  borderRadius: kBorderRadius,
  borderColor: TemboColors.primary,
  borderWidth: 1.5,
  foregroundColor: TemboColors.primary,
  padding: EdgeInsets.symmetric(horizontal: 20),
  textStyle: TextStyle(
    fontSize: 14,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
  ),
);

const _unselectedOptionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: TemboColors.surface,
  borderRadius: kBorderRadius,
  borderColor: TemboColors.border,
  borderWidth: 1,
  foregroundColor: Color.fromRGBO(0, 0, 0, .7),
  padding: EdgeInsets.symmetric(horizontal: 20),
  textStyle: TextStyle(
    fontSize: 14,
    fontFamily: kFontFamily,
  ),
);

const _bottomNavBarStyle = TemboButtonStyle.filled(
  height: 60,
  borderRadius: 0,
);

const _datePickerStyle = TemboDatePickerDecoration(
  hintStyle: TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.normal,
  ),
  buttonStyle: TemboButtonStyle.outline(
    height: 50,
    borderColor: TemboColors.border,
    borderRadius: kBorderRadius,
    textStyle: TextStyle(
      fontSize: 14,
      color: TemboColors.onBackground,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal,
    ),
  ),
);

const _textFieldDecoration = TemboTextFieldDecoration(
  borderColor: Colors.black54,
  borderRadius: kBorderRadius,
  size: Size.fromHeight(50),
  hintStyle: _hintStyle,
  valueStyle: _valueStyle,
);

const _hintStyle = TextStyle(
  fontSize: 16,
  color: Colors.black54,
  fontFamily: kFontFamily,
  fontWeight: FontWeight.normal,
);

const _valueStyle = TextStyle(
  fontSize: 16,
  color: TemboColors.onBackground,
  fontFamily: kFontFamily,
  fontWeight: FontWeight.normal,
);
