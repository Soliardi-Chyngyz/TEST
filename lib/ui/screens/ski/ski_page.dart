import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test/core/bloc/base_bloc_state.dart';
import 'package:test/core/utils/extenstions/custom_appbar.dart';
import 'package:test/data/model/ski_model/ski_model.dart';
import 'package:test/ui/screens/ski/bloc/bloc_ski.dart';
import 'package:test/ui/screens/ski/bloc/event_ski.dart';
import 'package:test/ui/screens/ski/widgets/ski_content.dart';

import '../../../core/extenstions/custom_views.dart';

class SkiListPage extends HookWidget {
  const SkiListPage({Key? key}) : super(key: key);
  static const routeName = '/SkiPage';

  @override
  Widget build(BuildContext context) {

    void requests() => context.read<BlocSki>().add(const SkiEvent());

    useEffect(() {
      requests();
      return null;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Активности'),
      body: BlocBuilder<BlocSki, BaseState>(builder: (ctx, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.done:
            final response = state.responseValue as List<SkiModel>;
            return SkiContentWidget(response);
          case Status.error:
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showSnackBar(ctx, state.error.toString());
            });
            return const SizedBox.shrink();
        }
      })
    );
  }
}
