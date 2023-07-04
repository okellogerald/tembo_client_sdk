import 'package:intl/intl.dart';

final tzsFormatter = NumberFormat.currency(symbol: "TZS ", decimalDigits: 0);

final compactTZSFormatter =
    NumberFormat.compactCurrency(symbol: "TZS ", decimalDigits: 0);
