import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class LanguageContent extends StatelessWidget {
  const LanguageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'select_language'.tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.font22DarkBold,
    );
  }
}
