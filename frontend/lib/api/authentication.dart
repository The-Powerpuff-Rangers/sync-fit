import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:sync_fit/utils/syncfit_exception.dart';

import '../utils/constants.dart';

class Authentication {
  final FlutterSecureStorage _flutterSecureStorage;
  final Dio dio;
  Authentication(this._flutterSecureStorage, this.dio);
  Future<String?> login() async {
    try {
      final result =
          await FlutterWebAuth2.authenticate(url: authpoint, callbackUrlScheme: 'syncfit');

      final token = Uri.parse(result).queryParameters['code'];
      if (token != null) {
        // await _flutterSecureStorage.write(key: 'token', value: token);
        return token;
      }
    } on SyncFitException catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }

  Future<void> logout() async {
    await _flutterSecureStorage.delete(key: 'token');
  }

  Future<bool> completeRegistration() async {
    return false;
  }
}
