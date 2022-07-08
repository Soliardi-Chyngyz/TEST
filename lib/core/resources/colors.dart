import 'package:flutter/material.dart';

const gray = Color(0xFF636875);
const secondaryGray = Color(0xFF6E7AA5);
const lightColor = Color(0xFFC2C2C2);
const subtitleColor = Color(0xFF858DA4);


const titleColor = Colors.white;
const blackTitle = Colors.black;

const bodyTextColor = Color(0xFFFFFFFF);
const borderColor = Color(0x14FFFFFF);
const lightBack = Color(0x1496C3F3);
const backgroundColor = Colors.white;

const textFieldBackColor = Color(0x0AFFFFFF);

const firstGradient = Color(0xFF5E94E1);
const lastGradient = Color(0xFF4271B5);

final Shader linearGradient = const LinearGradient(
  colors: <Color>[firstGradient, lastGradient],
).createShader(
  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);