import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:windig/common.dart';
import 'package:windig/generated/app_localizations.dart';
import 'package:windig/helper.dart';
import 'package:windig/log.dart';
import 'package:windig/models/common.dart';
import 'package:windig/providers/secure_storage_provider.dart';
import 'package:windig/widgets/common.dart';
import 'package:windig/widgets/input_key.dart';
import 'package:windig/widgets/wind_compass.dart';

class WeatherInfoScreen extends ConsumerStatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  ConsumerState<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends ConsumerState<WeatherInfoScreen> {
  String? owmKey;
  String? loading;
  String? na;
  String? currentWindSpeed;
  String? forecastWindSpeed;
  String? currentWindDirection;
  String? forecastWindDirection;
  String? n;
  String? ne;
  String? e;
  String? se;
  String? s;
  String? sw;
  String? w;
  String? nw;
  String? currentTemperature;
  String? forecastTemperature;
  String? currentRain;
  String? forecastRain;
  double? compassHeading;
  String? lastUpdated;
  Direction direction = Direction.N;

  StreamSubscription<CompassEvent>? _compassSubscription;

  @override
  void initState() {
    super.initState();

    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (mounted) {
        setState(() {
          compassHeading = event.heading;
        });
      }
    });
  }

  @override
  void dispose() {
    _compassSubscription?.cancel();
    super.dispose();
  }

  void _setState(String message) {
    setState(() {
      currentWindSpeed = message;
      forecastWindSpeed = message;
      currentWindDirection = message;
      forecastWindDirection = message;
      currentTemperature = message;
      forecastTemperature = message;
      currentRain = message;
      forecastRain = message;
    });
  }

  void setLoadingState() {
    _setState(loading!);
  }

  void setNotAvailableState() {
    _setState(na!);
  }

  void updateWeatherInfo(BuildContext context) {
    setLoadingState();
    fetchCurrentWeatherInfo();
    fetchForecastWeatherInfo();
    lastUpdated = DateTime.now().toLocal().toString().split('.')[0];
  }

  Future<void> fetchCurrentWeatherInfo() async {
    try {
      Position position = await determinePosition(context);
      final latitude = position.latitude;
      final longitude = position.longitude;

      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$owmKey&units=metric';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log.debug("current: $data", name: '$runtimeType');
        setState(() {
          double tempC = data['main']['temp']?.toDouble() ?? 0.0;
          currentTemperature = '${tempC.toStringAsFixed(1)} °C';

          double speedMs = data['wind']['speed']?.toDouble() ?? 0.0;
          double speedKmh = speedMs * 3.6;
          currentWindSpeed = '${speedKmh.toStringAsFixed(1)} km/h';

          int deg = data['wind']['deg'];
          List<String?> localizedDirections = [n, ne, e, se, s, sw, w, nw];
          int i = ((deg + 22.5) ~/ 45) % 8;
          currentWindDirection = localizedDirections[i];
          direction = Direction.values[i];

          double rain = data['rain']?['1h']?.toDouble() ?? 0.0;
          currentRain = '${rain.toStringAsFixed(1)} mm';
        });
      } else {
        log.error(
          'fetching current weather info resulted in status code ${response.statusCode}',
          name: '$runtimeType',
        );
        setNotAvailableState();
      }
    } catch (e) {
      log.error(
        'error fetching current weather info',
        error: e,
        name: '$runtimeType',
      );
      setNotAvailableState();
    }
  }

  Future<void> fetchForecastWeatherInfo() async {
    try {
      Position position = await determinePosition(context);
      final latitude = position.latitude;
      final longitude = position.longitude;

      final url =
          'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$owmKey&units=metric&cnt=1';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log.debug("forecast: $data", name: '$runtimeType');
        setState(() {
          double tempC = data['list'][0]['main']['temp']?.toDouble() ?? 0.0;
          forecastTemperature = '${tempC.toStringAsFixed(1)} °C';

          double windSpeedMs =
              data['list'][0]['wind']['speed']?.toDouble() ?? 0.0;
          double windSpeedKmh = windSpeedMs * 3.6;
          forecastWindSpeed = '${windSpeedKmh.toStringAsFixed(1)} km/h';

          int deg = data['list'][0]['wind']['deg'];
          List<String?> localizedDirections = [n, ne, e, se, s, sw, w, nw];
          int i = ((deg + 22.5) ~/ 45) % 8;
          forecastWindDirection = localizedDirections[i];

          double rain = data['list'][0]['rain']?['3h']?.toDouble() ?? 0.0;
          forecastRain = '${rain.toStringAsFixed(1)} mm';
        });
      } else {
        log.error(
          'fetching forecast weather info resulted in status code ${response.statusCode}',
          name: '$runtimeType',
        );
        setState(() {
          forecastTemperature = na;
          forecastWindSpeed = na;
          forecastWindDirection = na;
          forecastRain = na;
        });
      }
    } catch (e) {
      log.error(
        'error fetching forecast weather info',
        error: e,
        name: '$runtimeType',
      );
      setState(() {
        forecastTemperature = na;
        forecastWindSpeed = na;
        forecastWindDirection = na;
        forecastRain = na;
      });
    }
  }

  Future<Position> determinePosition(BuildContext context) async {
    final localizations = AppLocalizations.of(context);
    LocationPermission permission;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!context.mounted) return Future.error('Widget disposed');
      showAlertDialogOK(
        context,
        localizations?.problem ?? '',
        localizations?.serviceDisabled ?? '',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!context.mounted) return Future.error('Widget disposed');
        showAlertDialogOK(
          context,
          localizations?.problem ?? '',
          localizations?.locationPermissionDenied ?? '',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!context.mounted) return Future.error('Widget disposed');
      showAlertDialogOK(
        context,
        localizations?.problem ?? '',
        localizations?.locationPermissionDeniedForever ?? '',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  Widget getFloatingButtons(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);

    Icon themeIcon = Icon(Icons.nightlight_round);
    final mode = AdaptiveTheme.of(context).mode;
    if (mode == AdaptiveThemeMode.dark || mode == AdaptiveThemeMode.system) {
      themeIcon = Icon(Icons.wb_sunny);
    }

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      backgroundColor: Style.seedColor,
      // this is ignored if animatedIcon is non null
      // child: Icon(Icons.add),
      curve: Curves.bounceIn,
      overlayOpacity: 0.5,
      tooltip: localizations?.menu ?? '',
      heroTag: 'menu-hero-tag',
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.info),
          label: localizations?.about ?? '',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => showWindigAboutDialog(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.key),
          label: localizations?.key ?? '',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => showKeyInputDialog(context, ref),
        ),
        SpeedDialChild(
          child: themeIcon,
          label: localizations?.theme ?? '',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => toggleTheme(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.help_outlined),
          label: localizations?.info ?? '',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => browseTo(Url.web),
        ),
        SpeedDialChild(
          child: Icon(Icons.refresh),
          label: localizations?.refresh ?? '',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => updateWeatherInfo(context),
        ),
      ],
    );
  }

  void toggleTheme(BuildContext context) {
    final mode = AdaptiveTheme.of(context).mode;
    log.debug('theme mode changed to: $mode', name: 'toggleTheme');

    if (mode == AdaptiveThemeMode.dark || mode == AdaptiveThemeMode.system) {
      AdaptiveTheme.of(context).setLight();
      return;
    }
    AdaptiveTheme.of(context).setDark();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    loading = localizations?.loading ?? '';
    na = localizations?.na ?? '';
    n = localizations?.n ?? '';
    ne = localizations?.ne ?? '';
    e = localizations?.e ?? '';
    se = localizations?.se ?? '';
    s = localizations?.s ?? '';
    sw = localizations?.sw ?? '';
    w = localizations?.w ?? '';
    nw = localizations?.nw ?? '';

    final key = ref.watch(secureStorageProvider);
    if (owmKey != key && key.isNotEmpty) {
      owmKey = key;
      updateWeatherInfo(context);
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations?.currentWindSpeed(currentWindSpeed!) ?? '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(
                    localizations?.currentWindDirection(
                          currentWindDirection!,
                        ) ??
                        '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(
                    localizations?.currentTemperature(currentTemperature!) ??
                        '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(localizations?.currentRain(currentRain!) ?? ''),
                  const SizedBox(height: Style.space),
                ],
              ),
              compassHeading != null
                  ? Transform.rotate(
                      angle: (compassHeading! * (math.pi / 180) * -1),
                      child: Icon(
                        Icons.navigation,
                        size: 100,
                        color: Style.seedColor,
                      ),
                    )
                  : Text(localizations?.compassNA ?? ''),
              const SizedBox(height: Style.smallSpace),
              // Wind direction indicator (compass-based)
              compassHeading != null &&
                      currentWindDirection != loading &&
                      currentWindDirection != na
                  ? CustomPaint(
                      size: const Size(100, 100),
                      painter: WindCompassPainter(
                        compassHeading: compassHeading!,
                        windDirection: direction,
                      ),
                    )
                  : Text(
                      localizations?.windDirectionIndicatorNA ?? '',
                    ), // const SizedBox.shrink(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Style.space),
                  Text(
                    localizations?.forecastWindSpeed(forecastWindSpeed!) ?? '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(
                    localizations?.forecastWindDirection(
                          forecastWindDirection!,
                        ) ??
                        '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(
                    localizations?.forecastTemperature(forecastTemperature!) ??
                        '',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: Style.smallSpace),
                  Text(localizations?.forecastRain(forecastRain!) ?? ''),
                ],
              ),
              const SizedBox(height: Style.bigSpace),
              Text(
                localizations?.lastUpdated(lastUpdated!) ?? '',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: getFloatingButtons(context, ref),
    );
  }
}
