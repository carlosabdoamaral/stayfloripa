import 'package:url_launcher/url_launcher_string.dart';

void launchAnyURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Não foi possível abrir o link $url';
  }
}

void sendEmail(String to, String subject, String body) async {
  String urlString =
      'mailto:$to?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';
  launchAnyURL(urlString);
}

void sendMessage(String to, String message) async {
  String urlString = 'https://wa.me//$to?text=$message';
  launchAnyURL(urlString);
}
