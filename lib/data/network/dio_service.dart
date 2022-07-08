import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test/data/network/session_intercepter.dart';

import '../../core/utils/constants.dart';

class DioService {
  static BaseOptions opts = BaseOptions(
    baseUrl: apiFullBaseUrl,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio
      ..interceptors.addAll([
        SessionIntercepter(),
        PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        )
      ]);
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  getRequest<K>({
    required String endPoint,
    Map<String, K>? query,
  }) async {
    Response response;

    final Map<String, dynamic> headers = {};
    try {
      response = await baseAPI.get(endPoint,
          queryParameters: query, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log(e.message);
      return e.response;
    } catch (error) {
      log(error.toString());
    }
  }

  postHTTP(
      {required String endPoint,
        required dynamic data,
        Map<String, dynamic> headers = const {}}) async {
    Response response;
    try {
      response = await baseAPI.post(endPoint,
          data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log(e.message);
      return e.response;
    } catch (error) {
      log(error.toString());
    }
  }

  putHTTP(
      {required String endPoint,
        required dynamic data,
        Map<String, dynamic> headers = const {}}) async {
    Response response;
    try {
      response = await baseAPI.put(endPoint,
          data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log(e.message);
      return e.response;
    } catch (error) {
      log(error.toString());
    }
  }

  patchHTTP(
      {required String endPoint,
        required dynamic data,
        Map<String, dynamic> headers = const {}}) async {
    Response response;
    try {
      response = await baseAPI.patch(endPoint,
          data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log(e.message);
      return e.response;
    } catch (error) {
      log(error.toString());
    }
  }

  deleteHTTP<K>(
      {required String endPoint,
        Map<String, K>? query,
        Map<String, dynamic> headers = const {}}) async {
    Response response;
    try {
      response =
      await baseAPI.delete(endPoint, queryParameters: query, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log(e.message);
      return e.response;
    } catch (error) {
      log(error.toString());
    }
  }
}