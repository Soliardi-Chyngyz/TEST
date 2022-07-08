import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        fontFamily: 'Lato',
        highlightColor: secondaryGray.withOpacity(0.5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
          },
        ),
        unselectedWidgetColor: borderColor,
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
                color: titleColor,
                height: 1.3),
            headline2: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: titleColor),
            headline3: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: titleColor,
                height: 1.25),
            headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: titleColor,
                height: 1.2),
            headline6: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                color: Colors.brown),
            bodyText2: TextStyle(
                color: bodyTextColor,
                fontSize: 16.0,
                height: 1.2,
                fontWeight: FontWeight.w400),
            button: TextStyle(color: Colors.cyan)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                side: const BorderSide(width: 1.0, color: borderColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                // primary: textFieldBackColor,
                // onPrimary: Colors.white,
                elevation: 0,
                textStyle: const TextStyle(color: bodyTextColor,
                    height: 1.6, fontWeight: FontWeight.w600, fontSize: 16))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: borderColor),
                primary: borderColor,
                padding: const EdgeInsets.all(16),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // primary: blue,
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        )),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent)
    );
  }
}

const lightTextStyle = TextStyle(
    color: lightColor,
    fontSize: 12.0,
    height: 1.4,
    fontWeight: FontWeight.w400);

const darkTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    height: 1.2,
    fontWeight: FontWeight.w400);
