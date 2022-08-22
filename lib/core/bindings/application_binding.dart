import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/constants.dart';
import '../networking/logging_interceptor.dart';

class ApplicationBinding implements Bindings {
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: URLs.api,
      connectTimeout: AppLimit.kRequestTimeout,
      receiveTimeout: AppLimit.kRequestTimeout,
      sendTimeout: AppLimit.kRequestTimeout,
    );

    var dio = Dio(options);

    dio.interceptors.add(LoggingInterceptor());

    return dio;
  }

  @override
  void dependencies() {
    Get.lazyPut(
      _dio,
    );
  }
}
