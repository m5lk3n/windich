import 'package:flutter/material.dart';

abstract class Common {
  static late String appName;
  static late String appVersion;
  static late String packageName;
  static late String buildNumber;

  static int appStartYear = 2025;
}

class AppLocalization {
  static const List<Locale> supportedLocales = [
    Locale('de', ''),
    Locale('en', ''),
  ];
}

abstract class Style {
  static const smallSpace = 10.0;
  static const space = 16.0;
  static const bigSpace = 50.0;
  static const Color seedColor = Colors.blue;
}

abstract class Url {
  static const String dev = 'https://lttl.dev';
  static const String key = 'https://windig.lttl.dev#key';
  static const String privacy =
      'https://windig.lttl.dev/privacy'; // followed by _<lang>
  static const String disclaimer =
      'https://windig.lttl.dev/disclaimer'; // followed by _<lang>
}
