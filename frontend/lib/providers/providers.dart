import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_fit/api/authentication.dart';

import '../models/token.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  throw UnimplementedError();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final futureTokensProvider = FutureProvider<Token?>((ref) async {
  final instance = ref.watch(secureStorageProvider);
  final token = await instance.read(key: 'token');
  if (token != null) {
    return Token(token: token);
  }
  return null;
});

final authApiProvider = Provider<Authentication>((ref) {
  final instance = ref.watch(secureStorageProvider);
  return Authentication(instance);
});
