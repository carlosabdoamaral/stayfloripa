String getPhoneFormatted(String phone) {
  String country = phone.substring(0, 2);
  String ddd = phone.substring(2, 4);

  String first = phone.substring(5, 9);
  String second = phone.substring(9);
  return "+$country $ddd $first-$second";
}
