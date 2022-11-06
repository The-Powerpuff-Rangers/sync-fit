import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sync_fit/utils/constants.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: endpoint);
  dio.interceptors.add(PrettyDioLogger(
    compact: true,
    requestHeader: true,
    error: true,
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));
  return dio;
});
