import 'package:intl/intl.dart';

abstract class Helpers {
  static String formatCurrency(num value) {
    if (value != null) {
      if (value % 1 == 0) {
        return NumberFormat.currency(decimalDigits: 0, symbol: '')
            .format(value);
      } else {
        return NumberFormat.currency(decimalDigits: 2, symbol: '')
            .format(value);
      }
    } else {
      return '0';
    }
  }

  static String formatDate(DateTime dateTime) =>
      DateFormat.yMd('es_AR').format(dateTime);


  static String capitalize(String s) {
    if (s.isNotEmpty) {
      return s[0].toUpperCase() + s.substring(1);
    } else {
      return '';
    }
  }
}

