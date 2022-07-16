import 'package:flutter/material.dart';

import 'package:onfly/app/core/theme/app_colors.dart';

InputDecoration getFormFieldDecoration(BuildContext context, bool enabled, String label) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  return InputDecoration(
    floatingLabelStyle: const TextStyle(color: AppColors.indigoA700),
    contentPadding: const EdgeInsets.fromLTRB(16, 18, 24, 14),
    enabled: enabled,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.indigoA700, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.38), width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackDisabled, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red900, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red900, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    labelText: label,
    errorText: null,
    errorStyle: textTheme.subtitle2?.copyWith(color: AppColors.red900),
    fillColor: Colors.transparent,
    filled: true,
  );
}

InputDecoration getTextFieldDecoration({
  required BuildContext context,
  required bool enabled,
  required String label,
  required bool isInvalid,
}) {
  return getFormFieldDecoration(context, enabled, label).copyWith(
    suffixIcon: isInvalid
        ? const Icon(
            Icons.error_outline,
            color: AppColors.red900,
            size: 24,
          )
        : null,
  );
}
