import 'package:flutter/material.dart';
import 'package:test/core/resources/colors.dart';

InputDecoration textFieldStyle(
    {String? labelTextStr,
    double radius = 12,
    String hintTextStr = "Введите данные",
    Widget? icon,
    Widget? suffixIcon,
    required BuildContext context,
    Function? callback}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(12),
    labelText: labelTextStr,
    hintText: hintTextStr,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: textFieldBackColor,
    hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: bodyTextColor.withOpacity(0.3)),
    labelStyle:
        Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: borderColor, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: borderColor, width: 1.0),
    ),
    prefixIcon: icon == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 5, right: 0),
            child: SizedBox(
              height: 4,
              child: icon,
            ),
          ),
    suffixIcon: suffixIcon == null
        ? null
        : IconButton(icon: suffixIcon, onPressed: () => callback!()),
  );
}

