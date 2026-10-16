import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class CompletedTitle extends StatelessWidget {
  const CompletedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'login_successfully'.tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.font22DarkBold,
    );
  }
}

class CompletedSubtitle extends StatelessWidget {
  const CompletedSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        'login_success_subtitle'.tr(),
        textAlign: TextAlign.center,
        style: AppTextStyles.font14GreyRegular,
      ),
    );
  }
}
