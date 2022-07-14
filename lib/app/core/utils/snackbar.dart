import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onfly/app/core/theme/app_colors.dart';

void showGetSnackbar({
  required String text,
  String? buttonText,
  SnackPosition position = SnackPosition.BOTTOM,
  int duration = 1,
}) {
  if (Get.isSnackbarOpen) Get.back();

  Get.rawSnackbar(
    snackPosition: position,
    duration: Duration(seconds: duration),
    borderRadius: 4,
    backgroundColor: AppColors.blackSurface,
    margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
    padding: const EdgeInsets.all(16),
    messageText: Text(text, style: Get.theme.textTheme.caption!.copyWith(color: Colors.white)),
    mainButton: buttonText == null
        ? null
        : TextButton(
            child: Text(buttonText, style: Get.theme.textTheme.caption!.copyWith(color: Colors.white)),
            onPressed: () => Get.back(),
          ),
  );
}
