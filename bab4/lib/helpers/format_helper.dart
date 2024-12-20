import 'package:intl/intl.dart';

String formatToRupiah(dynamic number) {
  return NumberFormat.currency(
    locale: 'en_US', // Locale Indonesia
    symbol: '\$',    // Simbol mata uang
    decimalDigits: 0, // Tidak ada desimal
  ).format(number);
}
