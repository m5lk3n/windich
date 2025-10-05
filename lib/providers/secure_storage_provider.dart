import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windich/common.dart';
import 'package:windich/services/secure_storage.dart';

abstract class _SecureStorageKeys {
  static String prefix = Common.packageName;
  static String key = "$prefix.key";
}

class SecureStorageNotifier extends Notifier<String> {
  final _secureStorage = SecurePersistentLocalStorage();

  @override
  String build() {
    return '';
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
