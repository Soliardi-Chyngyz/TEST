import 'package:dio/dio.dart';
import 'package:test/data/model/ski_model/ski_model.dart';
import '../../core/base/base_data_state.dart';
import '../../core/extenstions/response_extenstions.dart';
import '../network/dio_service.dart';

class RepositorySki {
  RepositorySki(this._dioService);

  final DioService _dioService;

  Future<DataState<List<SkiModel>, DioError>> getSkies() async {
    final Response response = await _dioService.getRequest(
        endPoint: '/ticket-service/ticket-types/by-category-code/ACTIVITIES');

    final resStatus = responseState(response);
    switch (resStatus) {
      case StateResponse.success:
        {
          return DataSuccess((response.data as List)
              .map((e) => SkiModel.fromJson(e))
              .toList());
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
