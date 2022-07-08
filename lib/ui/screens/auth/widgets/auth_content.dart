import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/bloc/base_bloc_state.dart';
import 'package:test/data/model/auth_model/auth_model.dart';
import 'package:test/ui/screens/auth/bloc/bloc_auth.dart';
import 'package:test/ui/screens/auth/bloc/event_auth.dart';
import 'package:test/ui/screens/auth/widgets/edit_text.dart';

import '../../../../core/extenstions/custom_views.dart';
import '../../../../core/resources/colors.dart';
import '../../ski/ski_page.dart';

class AuthContentWidget extends HookWidget {
  const AuthContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final emailFocusMode = FocusNode();
    final passwordFocusNode = FocusNode();
    final requestModel = AuthModel();

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isBtnAvailable = useValueNotifier(false);
    final isLoading = useValueNotifier(false);

    void saveForm() {
      final isValid = formKey.currentState?.validate();
      if (!isValid!) {
        isBtnAvailable.value = false;
        return;
      }

      formKey.currentState?.save();

      context.read<BlocAuth>().add(PostAuthEvent(requestModel));
      isLoading.value = true;
    }

    void condition() {
      if (passwordController.text.isNotEmpty &&
          emailController.text.isNotEmpty) {
        isBtnAvailable.value = true;
      } else {
        isBtnAvailable.value = false;
      }
    }

    useEffect(() {
      isLoading.value = false;
      emailController.addListener(() {
        condition();
      });
      passwordController.addListener(() {
        condition();
      });
      return null;
    });

    return BlocConsumer<BlocAuth, BaseState>(
      listener: (ctx, state) {
        switch (state.status) {
          case Status.loading:
            break;
          case Status.done:
            isLoading.value = false;
            Navigator.of(context).pushNamedAndRemoveUntil(
                SkiListPage.routeName, (route) => false);
            break;
          case Status.error:
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showSnackBar(ctx, state.error.toString());
              isLoading.value = false;
            });
            break;
        }
      },
      builder: (ctx, _) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomEditText(
                  controller: emailController,
                  hintTextStr: 'E-mail',
                  focusNode: emailFocusMode,
                  textInputType: TextInputType.emailAddress,
                  onFocusNode: passwordFocusNode,
                  onChanged: (v) => requestModel.email = v),
              const SizedBox(
                height: 12,
              ),
              CustomEditText(
                  controller: passwordController,
                  hintTextStr: 'Пароль',
                  suffixIcon: SvgPicture.asset('asset/icons/eye.svg'),
                  focusNode: passwordFocusNode,
                  obscureText: true,
                  onFocusNode: passwordFocusNode,
                  onChanged: (v) => requestModel.password = v),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                  width: double.infinity,
                  child: HookBuilder(builder: (ctx) {
                    final isWhiteBack = useValueListenable(isBtnAvailable);
                    final isLoad = useValueListenable(isLoading);

                    return ElevatedButton(
                      onPressed: () => isLoad ? null : saveForm(),
                      style: ElevatedButton.styleFrom(
                          primary: isWhiteBack ? Colors.white : textFieldBackColor),
                      child: isLoad
                          ? const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: firstGradient,
                          strokeWidth: 1.5,
                        ),
                      )
                          : Text('Войти',
                          style: isWhiteBack
                              ? Theme.of(context).textTheme.bodyText2?.copyWith(
                              foreground: Paint()..shader = linearGradient)
                              : Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: bodyTextColor.withOpacity(0.3))),
                    );
                  })),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        // TODO
                      },
                      child: Text('Регистрация', style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 14, color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Text('Забыли пароль?',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 14, color: bodyTextColor.withOpacity(0.3))),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Или войдите через:',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset('asset/icons/g.svg'),
                    onPressed: () {
                      // TODO
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset('asset/icons/fb.svg'),
                    onPressed: () {
                      // TODO
                    },
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
