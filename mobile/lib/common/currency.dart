import 'package:StayFloripa/models/house_model.dart';
import 'package:intl/intl.dart';

String getHousePriceFormatted(HouseDetailsModel house) {
  double amount = house.price!;
  var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  String result = formatter.format(amount);
  return result;
}

String getAmountFormatted(double amount) {
  var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  String result = formatter.format(amount);
  return result;
}
