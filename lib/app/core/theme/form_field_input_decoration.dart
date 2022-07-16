import 'package:flutter/material.dart';

import 'package:onfly/app/core/theme/app_colors.dart';

InputDecoration getFormFieldDecoration(BuildContext context, bool enabled, String label) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  return InputDecoration(
    floatingLabelStyle: const TextStyle(color: AppColors.mainColor),
    contentPadding: const EdgeInsets.fromLTRB(16, 18, 24, 14),
    enabled: enabled,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.mainColor, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackDisabled, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackDisabled, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    labelText: label,
    errorText: null,
    errorStyle: textTheme.subtitle2?.copyWith(color: AppColors.errorColor),
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
            color: AppColors.errorColor,
            size: 24,
          )
        : null,
  );
}
