// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get motto => 'Vom Winde geweht';

  @override
  String get loading => 'Laden...';

  @override
  String get na => 'nicht verfügbar';

  @override
  String currentWindSpeed(Object currentWindSpeed) {
    return 'Aktuelle Windgeschwindigkeit: $currentWindSpeed';
  }

  @override
  String forecastWindSpeed(Object forecastWindSpeed) {
    return '3h Windgeschwindigkeit: $forecastWindSpeed';
  }

  @override
  String currentWindDirection(Object currentWindDirection) {
    return 'Aktuelle Windrichtung: $currentWindDirection';
  }

  @override
  String forecastWindDirection(Object forecastWindDirection) {
    return '3h Windrichtung: $forecastWindDirection';
  }

  @override
  String get n => 'N';

  @override
  String get ne => 'NO';

  @override
  String get e => 'O';

  @override
  String get se => 'SO';

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
    return 'Aktuelle Temperatur: $currentTemperature';
  }

  @override
  String forecastTemperature(Object forecastTemperature) {
    return '3h Temperatur: $forecastTemperature';
  }

  @override
  String currentRain(Object currentRain) {
    return 'Aktueller Regen: $currentRain';
  }

  @override
  String forecastRain(Object forecastRain) {
    return '3h Regen: $forecastRain';
  }

  @override
  String get compassNA => 'Kompass nicht verfügbar';

  @override
  String get windDirectionIndicatorNA =>
      'Windrichtungsanzeiger nicht verfügbar';

  @override
  String lastUpdated(Object dateTime) {
    return 'Zuletzt aktualisiert: $dateTime';
  }

  @override
  String get menu => 'Menü';

  @override
  String get about => 'Über';

  @override
  String get key => 'Schlüssel';

  @override
  String get theme => 'Design';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get language => 'Sprache';

  @override
  String get problem => 'Problem';

  @override
  String get serviceDisabled =>
      'Standortdienste müssen aktiviert sein, damit diese App funktioniert.';

  @override
  String get locationPermissionDenied =>
      'Standortzugriff muss gewährt werden, damit diese App funktioniert.\n\nStarte die App neu, um Zugriff erneut anzufragen.';

  @override
  String get locationPermissionDeniedForever =>
      'Benötigter Standortzugriff wurde permanent verweigert. Dieser kann nicht erneut durch die App angefragt werden.\n\nBitte Standortzugriff für diese App in den Systemeinstellungen gewähren.';

  @override
  String get ok => 'OK';

  @override
  String get enterKey => 'API Schlüssel eingeben';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get keySaved => 'Schlüssel gespeichert.';

  @override
  String get keyRemoved =>
      'Schlüssel gelöscht. Die App funkioniert nicht ohne Schlüssel!';

  @override
  String get disclaimer => 'Haftungsausschluss';

  @override
  String get privacyPolicy => 'Datenschutzbestimmungen';
}
