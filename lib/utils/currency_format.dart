import 'package:intl/intl.dart';

String currencyFormat(int price) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'IDR ',
    decimalDigits: 0,
  ).format(price);
}
