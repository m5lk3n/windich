import 'package:url_launcher/url_launcher.dart';
import 'package:windig/log.dart';

Future<void> browseTo(String url) async {
  if (url.isEmpty) {
    log.debug('empty url', name: 'browseTo');
    return;
  }

  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri)) {
    log.error('could not browse to $uri', name: 'browseTo');
  }
}
