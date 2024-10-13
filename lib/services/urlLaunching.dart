import 'package:url_launcher/url_launcher.dart';

void launch(String url) async {
  try {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
  } catch (e) {
    print("error");
  }
}
