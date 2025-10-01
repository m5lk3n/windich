// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get motto => 'Blown by the wind';

  @override
  String get loading => 'Loading...';

  @override
  String get na => 'n/a';

  @override
  String currentWindSpeed(Object currentWindSpeed) {
    return 'Current Wind Speed: $currentWindSpeed';
  }

  @override
  String forecastWindSpeed(Object forecastWindSpeed) {
    return '3h Wind Speed: $forecastWindSpeed';
  }

  @override
  String currentWindDirection(Object currentWindDirection) {
    return 'Current Wind Direction: $currentWindDirection';
  }

  @override
  String forecastWindDirection(Object forecastWindDirection) {
    return '3h Wind Direction: $forecastWindDirection';
  }

  @override
  String get n => 'N';

  @override
  String get ne => 'NE';

  @override
  String get e => 'E';

  @override
  String get se => 'SE';

  @override
  String get s => 'S';

  @override
  String get sw => 'SW';

  @override
  String get w => 'W';

  @override
  String get nw => 'NW';

  @override
  String currentTemperature(Object currentTemperature) {
    return 'Current Temperature: $currentTemperature';
  }

  @override
  String forecastTemperature(Object forecastTemperature) {
    return '3h Temperature: $forecastTemperature';
  }

  @override
  String currentRain(Object currentRain) {
    return 'Current Rain: $currentRain';
  }

  @override
  String forecastRain(Object forecastRain) {
    return '3h Rain: $forecastRain';
  }

  @override
  String get compassNA => 'Compass n/a';

  @override
  String get windDirectionIndicatorNA => 'Wind direction indicator n/a';

  @override
  String lastUpdated(Object dateTime) {
    return 'Last updated: $dateTime';
  }

  @override
  String get menu => 'Menu';

  @override
  String get about => 'About';

  @override
  String get key => 'Key';

  @override
  String get theme => 'Theme';

  @override
  String get refresh => 'Refresh';

  @override
  String get info => 'Info';

  @override
  String get language => 'Language';

  @override
  String get problem => 'Problem';

  @override
  String get serviceDisabled =>
      'Location services must be enabled for this app to work.';

  @override
  String get locationPermissionDenied =>
      'Location permissions must be granted for this app to work.\n\nRestart the app to grant permissions again.';

  @override
  String get locationPermissionDeniedForever =>
      'Required location permissions are permanently denied; the app cannot request permissions again.\n\nPlease enable location permissions for this app in the system settings.';

  @override
  String get ok => 'OK';

  @override
  String get enterKey => 'Enter a key';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get keySaved => 'Key saved.';

  @override
  String get keyRemoved => 'Key removed. The app won\'t work without a key!';

  @override
  String get keyUrl => 'https://windig.lttl.dev/#/en/?id=key';

  @override
  String get disclaimer => 'Disclaimer';

  @override
  String get disclaimerUrl => 'https://windig.lttl.dev/#/en/?id=disclaimer';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyUrl => 'https://windig.lttl.dev/#/en/?id=policy';
}
