import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @motto.
  ///
  /// In en, this message translates to:
  /// **'It is \"windich\" (windy).'**
  String get motto;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'n/a'**
  String get na;

  /// No description provided for @currentWindSpeed.
  ///
  /// In en, this message translates to:
  /// **'Current Wind Speed: {currentWindSpeed}'**
  String currentWindSpeed(Object currentWindSpeed);

  /// No description provided for @forecastWindSpeed.
  ///
  /// In en, this message translates to:
  /// **'3h Wind Speed: {forecastWindSpeed}'**
  String forecastWindSpeed(Object forecastWindSpeed);

  /// No description provided for @currentWindDirection.
  ///
  /// In en, this message translates to:
  /// **'Current Wind Direction: {currentWindDirection}'**
  String currentWindDirection(Object currentWindDirection);

  /// No description provided for @forecastWindDirection.
  ///
  /// In en, this message translates to:
  /// **'3h Wind Direction: {forecastWindDirection}'**
  String forecastWindDirection(Object forecastWindDirection);

  /// No description provided for @n.
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get n;

  /// No description provided for @ne.
  ///
  /// In en, this message translates to:
  /// **'NE'**
  String get ne;

  /// No description provided for @e.
  ///
  /// In en, this message translates to:
  /// **'E'**
  String get e;

  /// No description provided for @se.
  ///
  /// In en, this message translates to:
  /// **'SE'**
  String get se;

  /// No description provided for @s.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get s;

  /// No description provided for @sw.
  ///
  /// In en, this message translates to:
  /// **'SW'**
  String get sw;

  /// No description provided for @w.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get w;

  /// No description provided for @nw.
  ///
  /// In en, this message translates to:
  /// **'NW'**
  String get nw;

  /// No description provided for @currentTemperature.
  ///
  /// In en, this message translates to:
  /// **'Current Temperature: {currentTemperature}'**
  String currentTemperature(Object currentTemperature);

  /// No description provided for @forecastTemperature.
  ///
  /// In en, this message translates to:
  /// **'3h Temperature: {forecastTemperature}'**
  String forecastTemperature(Object forecastTemperature);

  /// No description provided for @currentRain.
  ///
  /// In en, this message translates to:
  /// **'Current Rain: {currentRain}'**
  String currentRain(Object currentRain);

  /// No description provided for @forecastRain.
  ///
  /// In en, this message translates to:
  /// **'3h Rain: {forecastRain}'**
  String forecastRain(Object forecastRain);

  /// No description provided for @compassNA.
  ///
  /// In en, this message translates to:
  /// **'Compass n/a'**
  String get compassNA;

  /// No description provided for @windDirectionIndicatorNA.
  ///
  /// In en, this message translates to:
  /// **'Wind direction indicator n/a'**
  String get windDirectionIndicatorNA;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {dateTime}'**
  String lastUpdated(Object dateTime);

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @key.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get key;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @problem.
  ///
  /// In en, this message translates to:
  /// **'Problem'**
  String get problem;

  /// No description provided for @serviceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services must be enabled for this app to work.'**
  String get serviceDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permissions must be granted for this app to work.\n\nRestart the app to grant permissions again.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Required location permissions are permanently denied; the app cannot request permissions again.\n\nPlease enable location permissions for this app in the system settings.'**
  String get locationPermissionDeniedForever;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @enterKey.
  ///
  /// In en, this message translates to:
  /// **'Enter a key'**
  String get enterKey;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @keySaved.
  ///
  /// In en, this message translates to:
  /// **'Key saved.'**
  String get keySaved;

  /// No description provided for @keyRemoved.
  ///
  /// In en, this message translates to:
  /// **'Key removed. The app won\'t work without a key!'**
  String get keyRemoved;

  /// No description provided for @keyUrl.
  ///
  /// In en, this message translates to:
  /// **'https://windig.lttl.dev/#/en/?id=key'**
  String get keyUrl;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimer;

  /// No description provided for @disclaimerUrl.
  ///
  /// In en, this message translates to:
  /// **'https://windig.lttl.dev/#/en/?id=disclaimer'**
  String get disclaimerUrl;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyUrl.
  ///
  /// In en, this message translates to:
  /// **'https://windig.lttl.dev/#/en/?id=policy'**
  String get privacyPolicyUrl;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
