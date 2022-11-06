import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sync_fit/models/activity.dart';
import 'package:sync_fit/models/sleep.dart';
import 'package:sync_fit/utils/syncfit_exception.dart';

import '../pages/login/providers/auth_provider.dart';
import '../providers/providers.dart';

final databaseApiProvider = Provider<Database>((ref) {
  final dio = ref.watch(dioProvider);
  final userId = ref.watch(futureTokensProvider).asData!.value!.userId;
  return Database(dio, userId);
});

class Database {
  final Dio dio;
  final String userId;
  Database(this.dio, this.userId);

  Future<Activity> getYellowCardData() async {
    try {
      final endpoint =
          '/fitness/yellowbar/$userId/${DateFormat("yyyy-MM-dd").format(DateTime.now())}';
      final response = await dio.get(endpoint);
      return Activity.fromMap(response.data);
    } on SyncFitException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Future<Sleep> getSleepCardData() async {
  //   try {
  //     final endpoint = '/fitness/sleep/$userId/${DateFormat("yyyy-MM-dd").format(DateTime.now())}';
  //     final response = await dio.get(
  //       endpoint,
  //     );
  //     return Sleep.fromMap(response.data);
  //   } on SyncFitException catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }

  Future<void> getSpo2CardData() async {
    try {
      final endpoint = '/fitness/spo2/$userId/${DateFormat("yyyy-MM-dd").format(DateTime.now())}';
      final response = await dio.get(
        endpoint,
      );
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }

  Future<void> getHeartRateCardData() async {
    try {
      final endpoint = '/fitness/heartrate/$userId';
      final response = await dio.get(endpoint);
    } on SyncFitException catch (e) {
      log(e.toString());
    }
  }
}
