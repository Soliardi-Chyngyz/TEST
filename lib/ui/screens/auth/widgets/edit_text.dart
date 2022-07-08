import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/extenstions/custom_views.dart';

// ignore: must_be_immutable
class CustomEditText extends HookWidget {
  CustomEditText(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.onFocusNode,
      required this.onChanged,
      this.hintTextStr = '',
      this.obscureText = false,
      this.suffixIcon,
      this.textInputType = TextInputType.text})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? onFocusNode;
  final Function(String?) onChanged;
  final String hintTextStr;
  final Widget? suffixIcon;
  final TextInputType textInputType;

  bool obscureText;

  @override
  Widget build(BuildContext context) {
    final isObscureNotifier = useValueNotifier(obscureText);

    String? validateEmail(String? value) {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty || !regex.hasMatch(value)) {
        return 'Введите допустимый e-mail адрес';
      } else {
        return null;
      }
    }

    return HookBuilder(builder: (ctx) {

      final isObscure = useValueListenable(isObscureNotifier);
      return TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyText2,
        obscureText: isObscure,
        decoration: textFieldStyle(
            hintTextStr: hintTextStr,
            context: context,
            suffixIcon: suffixIcon,
            callback: () => isObscureNotifier.value = !isObscureNotifier.value),
        autocorrect: false,
        onChanged: (v) => onChanged(v.trim()),
        focusNode: focusNode,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(onFocusNode),
        autofocus: true,
        validator: (value) {
          if (textInputType == TextInputType.emailAddress) {
            return validateEmail(value);
          }
          if (value?.isEmpty == true) {
            return 'Пожалуйста заполните';
          }
          return null;
        },
        onSaved: (value) => onChanged(value?.trim()),
      );
    });
  }
}
