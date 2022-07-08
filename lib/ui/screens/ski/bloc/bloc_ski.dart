import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/bloc/base_bloc_state.dart';
import 'package:test/data/repositories/repository_ski.dart';
import 'package:test/ui/screens/ski/bloc/event_ski.dart';

import '../../../../core/base/base_data_state.dart';

class BlocSki extends Bloc<BaseEvent, BaseState> {
  BlocSki(this._repositorySki) : super(const BaseState.loading()) {
    on<SkiEvent>(_onSkiEvent);
  }
  final RepositorySki _repositorySki;

  void _onSkiEvent(SkiEvent event, Emitter<BaseState> emit) async {
    final data = await _repositorySki.getSkies();

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
    if (data is DataSuccess) {
      return emit(BaseState.done(data.data));
    }
  }
}