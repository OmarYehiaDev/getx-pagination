import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('\n');
    }
    if (kDebugMode) {
      print(
        '--> ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'} ${'${options.baseUrl}${options.path}'}',
      );
    }
    if (kDebugMode) {
      print('Headers:');
    }
    options.headers.forEach(
      (k, dynamic v) {
        if (kDebugMode) {
          print('$k: $v');
        }
      },
    );
    if (options.queryParameters.isNotEmpty) {
      if (kDebugMode) {
        print('queryParameters:');
      }
      options.queryParameters.forEach(
        (k, dynamic v) {
          if (kDebugMode) {
            print('$k: $v');
          }
        },
      );
    }
    if (options.data != null) {
      if (kDebugMode) {
        print('Body: ${options.data}');
      }
    }
    if (kDebugMode) {
      print(
        '--> END ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'}',
      );
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('\n');
    }
    if (kDebugMode) {
      print(
          '<-- ${err.message} ${err.response!.requestOptions.data != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}');
    }
    if (kDebugMode) {
      print('${err.response != null ? err.response!.data : 'Unknown Error'}');
    }
    if (kDebugMode) {
      print('<-- End error');
    }
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('\n\n');
    }
    if (kDebugMode) {
      print(
          '<--- HTTP CODE : ${response.statusCode} URL : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    }
    if (kDebugMode) {
      print('Headers: ');
    }
    printWrapped('Response : ${response.data}');
    if (kDebugMode) {
      print('<--- END HTTP');
    }
    return super.onResponse(response, handler);
  }

  void printWrapped(String text) {
    final RegExp pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach(
      (RegExpMatch match) {
        if (kDebugMode) {
          print(
            match.group(0),
          );
        }
      },
    );
  }
}
