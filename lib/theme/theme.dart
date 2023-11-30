import 'package:flutter/material.dart';

const darkBlue = Color(0xFF00215C);
const pink = Color(0xFFC45178);
const gray500 = Color(0xFFD9D9D9);
const gray900 = Color(0xFF666666);

TextStyle fontH(double size, {Color? color, double? letterSpacing}) => TextStyle(
      fontSize: size,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w900,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
    );

TextStyle fontB(double size, {Color? color, double? letterSpacing}) => TextStyle(
      fontSize: size,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
    );

TextStyle fontM(double size, {Color? color, double? letterSpacing}) => TextStyle(
      fontSize: size,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
    );

TextStyle fontR(double size, {Color? color, double? letterSpacing}) => TextStyle(
      fontSize: size,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
    );
