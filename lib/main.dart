import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:windich/common.dart';
import 'package:windich/extensions/string.dart';
import 'package:windich/generated/app_localizations.dart';
import 'package:windich/log.dart';
import 'package:windich/screens/weather_info.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  Common.appName = packageInfo.appName.capitalize();
  Common.appVersion = packageInfo.version;
  Common.packageName = packageInfo.packageName;
  Common.buildNumber = packageInfo.buildNumber;

  await initLogging();
  await dotenv.load(fileName: ".env");

  log.debug(
    '${Common.appName} v${Common.appVersion}+${Common.buildNumber} started',
  );
}

Future<void> main() async {
  await initApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(ProviderScope(child: WindichApp(savedThemeMode: savedThemeMode)));
  });
}

class WindichApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const WindichApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    Locale locale = WidgetsBinding.instance.platformDispatcher.locale;
    log.debug('system locale: $locale', name: '$runtimeType');

    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Style.seedColor,
        textTheme: GoogleFonts.quicksandTextTheme().copyWith(
          headlineSmall: GoogleFonts.quicksand(),
          bodyMedium: GoogleFonts.quicksand(),
        ),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Style.seedColor,
        textTheme: GoogleFonts.quicksandTextTheme().copyWith(
          headlineSmall: GoogleFonts.quicksand(),
          bodyMedium: GoogleFonts.quicksand(),
        ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        locale: locale,
        theme: theme,
        darkTheme: darkTheme,
        title: Common.appName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const WeatherInfoScreen(),
      ),
    );
  }
}
