import 'package:flutter/material.dart';

import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../styles/box_decoration.dart';

/// For styling custom package components
class TemboThemeData {
  final String? fontFamily;

  /// Applies to all page titles
  final TextStyle? pageTitleStyle;

  /// Applies to all selected option buttons
  final TemboButtonStyle? selectedOptionButtonStyle;

  /// Applies to all un-selected option buttons
  final TemboButtonStyle? unselectedOptionButtonStyle;

  /// Applies to all bottom nav-bar buttons
  final TemboButtonStyle? bottomNavBarButtonStyle;

  /// Applies to all date pickers
  final TemboDatePickerDecoration? datePickerDecoration;

  /// Applies to all text-fields
  final TemboTextFieldDecoration? textFieldDecoration;

  /// Applies to the labelled form fields in the data verification before submission page
  final TemboLabelledFormFieldDecoration? labelledFormFieldDecoration;

  TemboThemeData({
    this.fontFamily,
    this.pageTitleStyle = _pageTitleStyle,
    this.selectedOptionButtonStyle = _selectedOptionButtonStyle,
    this.unselectedOptionButtonStyle = _unselectedOptionButtonStyle,
    this.datePickerDecoration = _datePickerStyle,
    this.textFieldDecoration = _textFieldDecoration,
    this.bottomNavBarButtonStyle = _bottomNavBarStyle,
    this.labelledFormFieldDecoration = _labelledFormFieldDecoration,
  });

  /// The color scheme used for the default styles
  TemboColorScheme get colorScheme {
    return const TemboColorScheme(
      primary: TemboColors.primary,
      onPrimary: TemboColors.onPrimary,
      error: TemboColors.error,
      onError: TemboColors.onError,
      background: TemboColors.background,
      onBackground: TemboColors.onBackground,
      surfaceContainer: TemboColors.surfaceContainer,
      onSurfaceContainer: TemboColors.onSurfaceContainer,
      title: TemboColors.title,
      hint: TemboColors.hint,
      border: TemboColors.border,
    );
  }

  /// Define [TemboThemeData] from [TemboColorScheme]. Only changes colors in [TemboThemeData] styles.
  /// Other style properties e.g border-radius remain the same(with default configuration).
  factory TemboThemeData.from(TemboColorScheme colors) {
    return TemboThemeData(
      fontFamily: null,
      pageTitleStyle: _pageTitleStyle.copyWith(color: colors.title),
      selectedOptionButtonStyle: _selectedOptionButtonStyle.copyWith(
        backgroundColor: colors.surfaceContainer,
        borderColor: colors.primary,
        foregroundColor: colors.primary,
      ),
      unselectedOptionButtonStyle: _unselectedOptionButtonStyle.copyWith(
        borderColor: colors.border,
        backgroundColor: colors.surfaceContainer,
        foregroundColor: colors.onSurfaceContainer,
      ),
      bottomNavBarButtonStyle: _bottomNavBarStyle.copyWith(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      datePickerDecoration: _datePickerStyle.copyWith(
        hintStyle: _datePickerHintStyle.copyWith(
          color: colors.hint,
        ),
        buttonStyle: _datePickerStyle.buttonStyle?.copyWith(
          backgroundColor: colors.surfaceContainer,
          foregroundColor: colors.onBackground,
          borderColor: colors.surfaceContainer,
        ),
      ),
      textFieldDecoration: _textFieldDecoration.copyWith(
        borderColor: colors.surfaceContainer,
        fillColor: colors.surfaceContainer,
        hintStyle: _textFieldHintStyle.copyWith(
          color: colors.hint,
        ),
        valueStyle: _textFieldValueStyle.copyWith(
          color: colors.onBackground,
        ),
      ),
      labelledFormFieldDecoration: _labelledFormFieldDecoration.copyWith(
          labelTextStyle: _labelledFormFieldDecoration.labelTextStyle?.copyWith(
            color: colors.hint,
          ),
          valueTextStyle: _labelledFormFieldDecoration.labelTextStyle?.copyWith(
            color: colors.onBackground,
          ),
          boxDecoration: _labelledFormFieldDecoration.boxDecoration?.copyWith(
            color: colors.surfaceContainer,
          )),
    );
  }
}

const _pageTitleStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: TemboColors.title,
);

const _selectedOptionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: TemboColors.surfaceContainer,
  borderRadius: 30,
  borderColor: TemboColors.primary,
  borderWidth: 2,
  foregroundColor: TemboColors.primary,
  padding: EdgeInsets.symmetric(horizontal: 20),
  textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
);

const _unselectedOptionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: TemboColors.surfaceContainer,
  borderRadius: 30,
  borderColor: TemboColors.border,
  borderWidth: 1,
  foregroundColor: TemboColors.onSurfaceContainer,
  padding: EdgeInsets.symmetric(horizontal: 20),
  textStyle: TextStyle(
    fontSize: 14,
  ),
);

const _bottomNavBarStyle = TemboButtonStyle.filled(
  height: 60,
  borderRadius: 0,
);

const _datePickerStyle = TemboDatePickerDecoration(
  hintStyle: _datePickerHintStyle,
  buttonStyle: TemboButtonStyle(
    height: 50,
    borderWidth: 1.5,
    borderColor: TemboColors.surfaceContainer,
    backgroundColor: TemboColors.surfaceContainer,
    foregroundColor: TemboColors.onBackground,
    borderRadius: kBorderRadius,
    textStyle: _datePickerTextStyle,
  ),
);

const _textFieldDecoration = TemboTextFieldDecoration(
  borderColor: TemboColors.surfaceContainer,
  fillColor: TemboColors.surfaceContainer,
  borderRadius: kBorderRadius,
  size: Size.fromHeight(50),
  hintStyle: _textFieldHintStyle,
  valueStyle: _textFieldValueStyle,
);

const _textFieldHintStyle = TextStyle(
  fontSize: 16,
  color: TemboColors.hint,
  fontWeight: FontWeight.normal,
);

const _textFieldValueStyle = TextStyle(
  fontSize: 16,
  color: TemboColors.onBackground,
  fontWeight: FontWeight.normal,
);

const _datePickerHintStyle = TextStyle(
  fontSize: 14,
  color: TemboColors.hint,
  fontWeight: FontWeight.normal,
);

const _datePickerTextStyle = TextStyle(
  fontSize: 14,
  color: TemboColors.onBackground,
  fontWeight: FontWeight.normal,
);

const _labelledFormFieldDecoration = TemboLabelledFormFieldDecoration(
  labelTextStyle: TextStyle(
    fontSize: 12,
    color: TemboColors.hint,
    fontWeight: FontWeight.normal,
  ),
  valueTextStyle: TextStyle(
    fontSize: 14,
    color: TemboColors.onBackground,
    fontWeight: FontWeight.bold,
  ),
  boxDecoration: TemboBoxDecoration(
    borderColor: TemboColors.surfaceContainer,
    borderWidth: 0,
    color: TemboColors.surfaceContainer,
  ),
);

TemboThemeData handleFontFamily(TemboThemeData data, String fontFamily) {
  return TemboThemeData(
    fontFamily: fontFamily,
    pageTitleStyle: data.pageTitleStyle?.copyWith(fontFamily: fontFamily),
    selectedOptionButtonStyle: data.selectedOptionButtonStyle?.copyWith(
      textStyle: data.selectedOptionButtonStyle?.textStyle?.copyWith(
        fontFamily: fontFamily,
      ),
    ),
    unselectedOptionButtonStyle: data.unselectedOptionButtonStyle?.copyWith(
      textStyle: data.unselectedOptionButtonStyle?.textStyle?.copyWith(
        fontFamily: fontFamily,
      ),
    ),
    bottomNavBarButtonStyle: data.bottomNavBarButtonStyle?.copyWith(
      textStyle: data.bottomNavBarButtonStyle?.textStyle?.copyWith(
        fontFamily: fontFamily,
      ),
    ),
    datePickerDecoration: data.datePickerDecoration?.copyWith(
      hintStyle: data.datePickerDecoration?.hintStyle?.copyWith(
        fontFamily: fontFamily,
      ),
      buttonStyle: data.datePickerDecoration?.buttonStyle?.copyWith(
        textStyle: data.datePickerDecoration?.buttonStyle?.textStyle?.copyWith(
          fontFamily: fontFamily,
        ),
      ),
    ),
    textFieldDecoration: data.textFieldDecoration?.copyWith(
      hintStyle: data.textFieldDecoration?.hintStyle.copyWith(
        fontFamily: fontFamily,
      ),
      valueStyle: data.textFieldDecoration?.valueStyle?.copyWith(
        fontFamily: fontFamily,
      ),
    ),
    labelledFormFieldDecoration: data.labelledFormFieldDecoration?.copyWith(
      labelTextStyle:
          data.labelledFormFieldDecoration?.labelTextStyle?.copyWith(
        fontFamily: fontFamily,
      ),
      valueTextStyle:
          data.labelledFormFieldDecoration?.valueTextStyle?.copyWith(
        fontFamily: fontFamily,
      ),
    ),
  );
}
