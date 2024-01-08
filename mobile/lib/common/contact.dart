import 'package:url_launcher/url_launcher_string.dart';

void sendEmail(String to, String subject, String body) async {
  String urlString =
      'mailto:$to?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';
  if (await canLaunchUrlString(urlString)) {
    await launchUrlString(urlString);
  } else {
    throw 'Não foi possível abrir o link $urlString';
  }
}

void sendMessage(String to, String message) async {
  String urlString = 'https://wa.me//$to?text=$message';
  if (await canLaunchUrlString(urlString)) {
    await launchUrlString(urlString);
  } else {
    throw 'Não foi possível abrir o link $urlString';
  }
}
