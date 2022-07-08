import 'package:test/core/bloc/base_bloc_state.dart';
import 'package:test/data/model/auth_model/auth_model.dart';

class PostAuthEvent extends BaseEvent {
  const PostAuthEvent(AuthModel model) : super(model: model);
}