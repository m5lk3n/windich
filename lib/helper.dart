import 'package:url_launcher/url_launcher.dart';
import 'package:windig/log.dart';

Future<void> browseTo(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri)) {
    log.error('could not browse to $uri', name: 'browseTo');
  }
}
