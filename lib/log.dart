import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

// https://stackoverflow.com/questions/75859813/retrieve-logs-from-customer-device-in-flutter

const String logFilePrefix = 'windig-log';
const String appName = 'WindigApp';
final log = Logger(appName);

extension LogExtensions on Logger {
  void release(String message, {String name = appName, Object? error}) {
    log.fine('[PROD] $name: $message', error);
  }

  void error(String message, {String name = appName, Object? error}) {
    log.finer('[ERROR] $name: $message', error);
  }

  void debug(String message, {String name = appName}) {
    log.finest('[DEBUG] $name: $message');
  }
}

Future<void> initLogging() async {
  final file = Platform.isAndroid
      ? await _localFile
      : null; // file logging doesn't work as intended below on iOS

  // log to stdout (and to logfile on Android)
  Logger.root.level = kDebugMode
      ? Level.ALL
      : Level.FINER; // INFO is the default
  Logger.root.onRecord.listen((record) {
    final String logMessage = '${record.time}: ${record.message}';
    dev.log(logMessage); // use dev.log to integrate with Flutter DevTools
    file?.writeAsStringSync(
      '$logMessage\n',
      mode: kDebugMode
          ? FileMode.append
          : FileMode.write, // overwrite in production
      flush: true, // TODO: check if flushing is necessary
    );
  });
}

Future<String> get _localPath async {
  final directory =
      // getTemporaryDirectory() // /data/user/0/dev.lttl.windig/cache - nothing found here
      // getApplicationDocumentsDirectory() // /data/user/0/dev.lttl.windig/app_flutter - nothing found here
      await getExternalStorageDirectory(); // /storage/emulated/0/Android/data/dev.lttl.windig/files

  return directory!.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  final logFile =
      '$path/$logFilePrefix-${kDebugMode ? 'debug' : 'release'}.txt'; // don't call it .log, as it's recognized as a binary file on Android

  dev.log('logging to $logFile', name: 'initLogging');

  return File(logFile);
}
