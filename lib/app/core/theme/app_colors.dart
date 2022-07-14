import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const black12 = Colors.black12;

  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const grey800 = Color(0xFF424242);
  static const grey900 = Color(0xFF212121);

  static const indigo50 = Color(0xFFE8EAF6);
  static const indigo100 = Color(0xFFE2E5FA);
  static const indigoA100 = Color(0xFF8C9EFF);
  static const indigoA200 = Color(0xFF536DFE);
  static const indigoA700 = Color(0xFF304FFE);
  static const indigoA700_12 = Color(0x30304FFE);

  static const indigoA700dark = Color(0xFF0026CA);

  static const green50 = Color(0xFFE8F5E9);
  static const green600 = Color(0xFF7CB342);
  static const green700 = Color(0xFF388E3C);
  static const green900 = Color(0xFF1B5E20);

  static const red50 = Color(0xFFFFEBEE);
  static const red700 = Color(0xFFD32F2F);
  static const red900 = Color(0xFFB71C1C);

  static const orange50 = Color(0xFFFFF3E0);
  static const orange800 = Color(0xFFEF6C00);
  static const orange900 = Color(0xFFE65100);

  static const deepOrange900 = Color(0xFFBF360C);

  static const blueGrey600 = Color(0xFF546E7A);

  static const lightBlue600 = Color(0xFF039BE5);

  static final blackDisabled = Colors.black.withOpacity(0.38);
  static final blackPressedOverlay = Colors.black.withOpacity(0.16);
  static const blackInactive = Colors.black54;
  static final blackMediumEmphasis = Colors.black.withOpacity(0.6);
  static const blackSurface = Color(0xFF202020);

  static final whiteDisabled = Colors.white.withOpacity(0.5);
  static final whiteInactive = Colors.white.withOpacity(0.54);
  static const whiteSmoke = Color(0xFFF5F5F5);
}
