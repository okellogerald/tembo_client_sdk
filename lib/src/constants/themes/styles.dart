part of "theme_data.dart";

const _pageTitleStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: LightTemboColors.title,
);

const _selectedOptionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: LightTemboColors.surfaceContainer,
  borderRadius: 30,
  borderColor: LightTemboColors.primary,
  borderWidth: 2,
  foregroundColor: LightTemboColors.primary,
  padding: EdgeInsets.symmetric(horizontal: 20),
  textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
);

const _unselectedOptionButtonStyle = TemboButtonStyle(
  height: 45,
  backgroundColor: LightTemboColors.surfaceContainer,
  borderRadius: 30,
  borderColor: LightTemboColors.border,
  borderWidth: 1,
  foregroundColor: LightTemboColors.onSurfaceContainer,
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
    borderColor: LightTemboColors.surfaceContainer,
    backgroundColor: LightTemboColors.surfaceContainer,
    foregroundColor: LightTemboColors.onBackground,
    borderRadius: kBorderRadius,
    textStyle: _datePickerTextStyle,
  ),
);

const _textFieldDecoration = TemboTextFieldDecoration(
  borderColor: LightTemboColors.surfaceContainer,
  fillColor: LightTemboColors.surfaceContainer,
  borderRadius: kBorderRadius,
  size: Size.fromHeight(50),
  hintStyle: _textFieldHintStyle,
  valueStyle: _textFieldValueStyle,
);

const _textFieldHintStyle = TextStyle(
  fontSize: 16,
  color: LightTemboColors.hint,
  fontWeight: FontWeight.normal,
);

const _textFieldValueStyle = TextStyle(
  fontSize: 16,
  color: LightTemboColors.onBackground,
  fontWeight: FontWeight.normal,
);

const _datePickerHintStyle = TextStyle(
  fontSize: 14,
  color: LightTemboColors.hint,
  fontWeight: FontWeight.normal,
);

const _datePickerTextStyle = TextStyle(
  fontSize: 14,
  color: LightTemboColors.onBackground,
  fontWeight: FontWeight.normal,
);

const _labelledFormFieldDecoration = TemboLabelledFormFieldDecoration(
  labelTextStyle: TextStyle(
    fontSize: 12,
    color: LightTemboColors.hint,
    fontWeight: FontWeight.normal,
  ),
  valueTextStyle: TextStyle(
    fontSize: 14,
    color: LightTemboColors.onBackground,
    fontWeight: FontWeight.bold,
  ),
  boxDecoration: TemboBoxDecoration(
    borderColor: LightTemboColors.surfaceContainer,
    borderWidth: 0,
    color: LightTemboColors.surfaceContainer,
  ),
);
