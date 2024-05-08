import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String convCurrency(double value) => NumberFormat.simpleCurrency().format(value);

}