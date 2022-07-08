import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/core/resources/colors.dart';

class CustomAppBar extends HookWidget with PreferredSizeWidget{
  final String title;
  final String subTitle;
  final bool automaticallyImplyLeading;
  final double elevation;
  final bool isBackPress;
  final MainAxisAlignment mainAxisAlignment;
  final bool isCenterTitle;

  const CustomAppBar(
      {this.title = '',
        this.subTitle = '',
        this.automaticallyImplyLeading = true,
        this.elevation = 0.0,
        this.isBackPress = true,
        this.isCenterTitle = true,
        this.mainAxisAlignment = MainAxisAlignment.center,
        Key? key})
      : super(key: key);

  void _popUp(BuildContext context) {
    if (isBackPress) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline2?.copyWith(color: blackTitle, fontWeight: FontWeight.w300)),
            if (subTitle.isNotEmpty)
              Text(' ($subTitle)',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.green))
          ]),
      centerTitle: isCenterTitle,
      titleSpacing: 0,
      leading: isBackPress
          ? IconButton(
          color: firstGradient,
          onPressed: () => _popUp(context),
          icon: SvgPicture.asset('asset/icons/back.svg', color: lastGradient))
          : null,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
