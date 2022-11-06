import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sync_fit/utils/syncfit_exception.dart';

class Database {
  final Dio dio;
  Database(this.dio);

  Future<void> getYellowCardData() async {
    try {} on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSleepCardData() async {
    try {} on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSpo2CardData() async {
    try {} on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getHeartRateCardData() async {
    try {} on SyncFitException catch (e) {
      log(e.toString());
    }
  }
}
