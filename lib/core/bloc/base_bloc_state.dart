import 'package:equatable/equatable.dart';

enum Status { loading, done, error }

class BaseState<T> extends Equatable {
  final T? responseValue;
  final T? error;
  final Status status;

  @override
  List<Object?> get props => [responseValue, error, status];

  const BaseState._(
      {this.status = Status.loading, this.responseValue, this.error});

  const BaseState.loading() : this._();

  const BaseState.done(T? value)
      : this._(responseValue: value, status: Status.done);

  const BaseState.error(T error) : this._(error: error, status: Status.error);
}


abstract class BaseEvent<T> extends Equatable {
  final T? model;
  const BaseEvent({this.model});

  @override
  List<Object?> get props => [model];
}