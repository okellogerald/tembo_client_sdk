// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../../styles/box_decoration.dart';

part 'styles.dart';

/// For styling custom package components
class TemboThemeData {
  final String? fontFamily;

  final TemboColorScheme colorScheme;

  /// Applies to all page titles
  final TextStyle pageTitleStyle;

  /// Applies to all selected option buttons
  final TemboButtonStyle selectedOptionButtonStyle;

  /// Applies to all un-selected option buttons
  final TemboButtonStyle unselectedOptionButtonStyle;

  /// Applies to all bottom nav-bar buttons
  final TemboButtonStyle bottomNavBarButtonStyle;

  /// Applies to all date pickers
  final TemboDatePickerDecoration datePickerDecoration;

  /// Applies to all text-fields
  final TemboTextFieldDecoration textFieldDecoration;

  /// Applies to the labelled form fields in the data verification before submission page
  final TemboLabelledFormFieldDecoration labelledFormFieldDecoration;

  const TemboThemeData({
    this.fontFamily,
    this.colorScheme = const TemboColorScheme.light(),
    this.pageTitleStyle = _pageTitleStyle,
    this.selectedOptionButtonStyle = _selectedOptionButtonStyle,
    this.unselectedOptionButtonStyle = _unselectedOptionButtonStyle,
    this.bottomNavBarButtonStyle = _bottomNavBarStyle,
    this.datePickerDecoration = _datePickerStyle,
    this.textFieldDecoration = _textFieldDecoration,
    this.labelledFormFieldDecoration = _labelledFormFieldDecoration,
  });

  /// Define [TemboThemeData] from [TemboColorScheme]. Only changes scheme in [TemboThemeData] styles.
  /// Other style properties e.g border-radius remain the same(with default configuration).
  factory TemboThemeData.from(TemboColorScheme scheme) {
    return TemboThemeData(
      fontFamily: null,
      colorScheme: scheme,
      pageTitleStyle: _pageTitleStyle.copyWith(color: scheme.title),
      selectedOptionButtonStyle: _selectedOptionButtonStyle.copyWith(
        backgroundColor: scheme.surfaceContainer,
        borderColor: scheme.primary,
        foregroundColor: scheme.primary,
      ),
      unselectedOptionButtonStyle: _unselectedOptionButtonStyle.copyWith(
        borderColor: scheme.border,
        backgroundColor: scheme.surfaceContainer,
        foregroundColor: scheme.onSurfaceContainer,
      ),
      bottomNavBarButtonStyle: _bottomNavBarStyle.copyWith(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      datePickerDecoration: _datePickerStyle.copyWith(
        hintStyle: _datePickerHintStyle.copyWith(
          color: scheme.hint,
        ),
        buttonStyle: _datePickerStyle.buttonStyle?.copyWith(
          backgroundColor: scheme.surfaceContainer,
          foregroundColor: scheme.onBackground,
          borderColor: scheme.surfaceContainer,
        ),
      ),
      textFieldDecoration: _textFieldDecoration.copyWith(
        borderColor: scheme.surfaceContainer,
        fillColor: scheme.surfaceContainer,
        hintStyle: _textFieldHintStyle.copyWith(
          color: scheme.hint,
        ),
        valueStyle: _textFieldValueStyle.copyWith(
          color: scheme.onBackground,
        ),
      ),
      labelledFormFieldDecoration: _labelledFormFieldDecoration.copyWith(
        labelTextStyle: _labelledFormFieldDecoration.labelTextStyle?.copyWith(
          color: scheme.hint,
        ),
        valueTextStyle: _labelledFormFieldDecoration.valueTextStyle?.copyWith(
          color: scheme.onBackground,
        ),
        boxDecoration: _labelledFormFieldDecoration.boxDecoration?.copyWith(
          color: scheme.surfaceContainer,
        ),
      ),
    );
  }

  TemboButtonStyle get defaultButtonStyle {
    return TemboButtonStyle.outline(
      borderRadius: 30,
      borderWidth: 2,
      padding: kHorPadding,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      borderColor: colorScheme.border,
      foregroundColor: colorScheme.onBackground,
    );
  }

  TemboThemeData copyWith({
    String? fontFamily,
    TemboColorScheme? colorScheme,
    TextStyle? pageTitleStyle,
    TemboButtonStyle? selectedOptionButtonStyle,
    TemboButtonStyle? unselectedOptionButtonStyle,
    TemboButtonStyle? bottomNavBarButtonStyle,
    TemboDatePickerDecoration? datePickerDecoration,
    TemboTextFieldDecoration? textFieldDecoration,
    TemboLabelledFormFieldDecoration? labelledFormFieldDecoration,
  }) {
    return TemboThemeData(
      fontFamily: fontFamily ?? this.fontFamily,
      colorScheme: colorScheme ?? this.colorScheme,
      pageTitleStyle: pageTitleStyle ?? this.pageTitleStyle,
      selectedOptionButtonStyle:
          selectedOptionButtonStyle ?? this.selectedOptionButtonStyle,
      unselectedOptionButtonStyle:
          unselectedOptionButtonStyle ?? this.unselectedOptionButtonStyle,
      bottomNavBarButtonStyle:
          bottomNavBarButtonStyle ?? this.bottomNavBarButtonStyle,
      datePickerDecoration: datePickerDecoration ?? this.datePickerDecoration,
      textFieldDecoration: textFieldDecoration ?? this.textFieldDecoration,
      labelledFormFieldDecoration:
          labelledFormFieldDecoration ?? this.labelledFormFieldDecoration,
    );
  }
}
