import 'package:flutter/material.dart';
import 'package:test/core/resources/colors.dart';

class GradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final String title;

  const GradientElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.borderRadius,
    this.gradient = const LinearGradient(colors: [lastGradient, firstGradient]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(12);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.w500),),
      ),
    );
  }
}