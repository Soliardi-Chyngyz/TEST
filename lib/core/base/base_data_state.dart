
abstract class DataState<T, M> {
  final T? data;
  final M? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T, M> extends DataState<T, M> {
  const DataSuccess(T? data) : super(data: data);
}

class DataFailed<T, M> extends DataState<T, M> {
  const DataFailed(M error) : super(error: error);
}