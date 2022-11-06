import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_fit/api/authentication.dart';

import '../models/token.dart';
import '../pages/login/providers/auth_provider.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  throw UnimplementedError();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final futureTokensProvider = FutureProvider<Token?>((ref) async {
  final instance = ref.watch(secureStorageProvider);
  final token = await instance.read(key: 'token');
  final userId = await instance.read(key: 'userId');
  if (token != null && userId != null) {
    return Token(token: token, userId: userId);
  }
  return null;
});

final authApiProvider = Provider<Authentication>((ref) {
  final instance = ref.watch(secureStorageProvider);
  final dio = ref.watch(dioProvider);
  return Authentication(instance, dio);
});
