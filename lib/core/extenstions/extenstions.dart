import 'package:intl/intl.dart';

String format(double? value) {
 final formatter = NumberFormat('#,###');
 return '${formatter.format(value).replaceAll(',', ' ')} ₸';
}

