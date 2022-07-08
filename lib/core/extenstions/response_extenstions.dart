import 'dart:io';
import 'package:dio/dio.dart';

Object responseState<T>(Response response) {
  if (response.statusCode == HttpStatus.ok ||
      response.statusCode == HttpStatus.created ||
      response.statusCode == HttpStatus.nonAuthoritativeInformation ||
      response.statusCode == HttpStatus.noContent) {
    return StateResponse.success;
  } else if (response.statusCode! >= 400 && response.statusCode! <= 410) {
    final map = response.data as Map;
    final key = map.keys.elementAt(0);
    final error = map[key];
    return DioError(
      error: error,
      response: response,
      requestOptions: response.requestOptions,
      type: DioErrorType.response,
    );
  } else {
    return StateResponse.error;
  }
}

enum StateResponse {
  success,
  error
}