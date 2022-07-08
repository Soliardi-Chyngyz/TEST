import 'package:dio/dio.dart';
import 'package:test/data/model/auth_model/auth_model.dart';

import '../../core/base/base_data_state.dart';
import '../../core/extenstions/response_extenstions.dart';
import '../model/auth_model/auth_reponse_model.dart';
import '../network/dio_service.dart';

enum AuthStatus { unknown, done, error }

class RepositoryAuth {
  RepositoryAuth(this._dioService);

  final DioService _dioService;

  Future<DataState<AuthResponse, DioError>> postAuth(AuthModel model) async {
    final Response response =
    await _dioService.postHTTP(endPoint: '/user-service/auth/login', data: model);

    final resStatus = responseState(response);
    switch (resStatus) {
      case StateResponse.success:
        {
          return DataSuccess(AuthResponse.fromJson(response.data));
        }
      case StateResponse.error:
        {
          throw Exception();
        }
      default:
        {
          return DataFailed(resStatus as DioError);
        }
    }
  }
}