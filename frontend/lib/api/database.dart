import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sync_fit/utils/syncfit_exception.dart';

class Database {
  final Dio dio;
  final String userId;
  Database(this.dio, this.userId);

  Future<void> getYellowCardData() async {
    try {
      const endpoint = '';
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSleepCardData() async {
    try {
      const endpoint = '/fitness/sleep';
      final response = await dio.get(
        endpoint,
        options: Options(headers: {'userId': userId}),
      );
      log(response.data);
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSpo2CardData() async {
    try {
      const endpoint = '/fitness/spo2';
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getHeartRateCardData() async {
    try {
      const endpoint = '/fitness/heartrate';
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }
}
