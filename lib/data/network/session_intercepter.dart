import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/utils/preference/preference.dart';

class SessionIntercepter extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    String? token = await Prefs().getToken();

    debugPrint('REQUEST[${options.method}] => PATH_SessionI: ${options.path}');
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }

    super.onRequest(options, handler); //continue
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH_SessionI: ${response.realUri.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    debugPrint(err.error);
    super.onError(err, handler);
  }
}
