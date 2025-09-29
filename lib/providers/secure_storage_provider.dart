import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windig/common.dart';
import 'package:windig/extensions/string.dart';
import 'package:windig/log.dart';
import 'package:windig/services/secure_storage.dart';

abstract class _SecureStorageKeys {
  static String prefix = Common.packageName;
  static String key = "$prefix.key";
}

class SecureStorageNotifier extends Notifier<String> {
  final _secureStorage = SecurePersistentLocalStorage();

  @override
  String build() {
    var owmKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY']?.trim() ?? '';
    log.debug(
      'using OpenWeatherMap API key: ${owmKey.scramble()}',
      name: '$runtimeType',
    );
    if (owmKey.isNotEmpty) {
      setKey(owmKey);
    }

    return owmKey;
  }

  Future<void> loadKey() async {
    final keyValue = await _secureStorage.read(key: _SecureStorageKeys.key);
    state = keyValue?.trim() ?? '';
  }

  Future<void> setKey(String keyValue) async {
    await _secureStorage.write(
      key: _SecureStorageKeys.key,
      value: keyValue.trim(),
    );
    state = keyValue.trim();
  }

  Future<void> removeKey() async {
    await _secureStorage.delete(key: _SecureStorageKeys.key);
    state = '';
  }
}

final secureStorageProvider = NotifierProvider<SecureStorageNotifier, String>(
  () => SecureStorageNotifier(),
);
