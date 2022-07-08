import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/theme/app_theme.dart';
import '../resources/colors.dart';

/* SnackBar */
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      content: Text(
        text,
        textAlign: TextAlign.center,
      )));
}

/* ListTile */
Widget customListTile(String title, Function callBack, [color = blackTitle]) {
  return Column(
    children: [
      const Divider(),
      ListTile(
        onTap: () => callBack(),
        title: Text(
          title,
          style: darkTextStyle.copyWith(color: color),
        ),
        contentPadding: const EdgeInsets.only(left: 0.0, right: 10),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        trailing: SvgPicture.asset(
          'asset/icons/next.svg',
          color: lastGradient,
        ),
      ),
    ],
  );
}
