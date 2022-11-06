import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:sync_fit/utils/syncfit_exception.dart';

import '../utils/constants.dart';

class Authentication {
  final FlutterSecureStorage _flutterSecureStorage;
  Authentication(this._flutterSecureStorage);
  Future<bool> login() async {
    try {
      final result =
          await FlutterWebAuth2.authenticate(url: authpoint, callbackUrlScheme: 'syncfit');

      final token = Uri.parse(result).queryParameters['code'];
      if (token != null) {
        await _flutterSecureStorage.write(key: 'token', value: token);
        return true;
      }
    } on SyncFitException catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  Future<void> logout() async {
    await _flutterSecureStorage.delete(key: 'token');
  }
}
