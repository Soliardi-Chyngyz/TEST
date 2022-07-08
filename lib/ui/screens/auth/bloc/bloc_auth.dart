import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/base/base_data_state.dart';
import 'package:test/core/bloc/base_bloc_state.dart';
import 'package:test/data/repositories/repository_auth.dart';
import 'package:test/ui/screens/auth/bloc/event_auth.dart';

import '../../../../core/utils/preference/preference.dart';
import '../../../../data/model/auth_model/auth_reponse_model.dart';

class BlocAuth extends Bloc<BaseEvent, BaseState> {
  BlocAuth(this._repositoryAuth) : super(const BaseState.loading()) {
    on<PostAuthEvent>(_onPostAuthEvent);
  }
  final RepositoryAuth _repositoryAuth;

  void _onPostAuthEvent(PostAuthEvent event, Emitter<BaseState> emit) async {
    final data = await _repositoryAuth.postAuth(event.model);

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }

    if (data is DataSuccess) {
      final model = data.data as AuthResponse;
      if (model.accessToken != null) Prefs().setToken(model.accessToken!);

      return emit(BaseState.done(data.data));
    }
  }
}