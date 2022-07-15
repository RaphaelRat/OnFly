import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

Widget menuIcon({required String texto, required IconData icone, required void Function() funcao}) {
  return GestureDetector(
    onTap: funcao,
    child: Row(
      children: [
        CircleAvatar(backgroundColor: AppColors.indigoA700, child: Icon(icone, size: 24, color: AppColors.whiteSmoke)),
        const SizedBox(width: 24),
        Text(texto, style: const TextStyle(fontSize: 24)),
      ],
    ),
  );
}
