import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class NextPageContent extends StatelessWidget {
  const NextPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'play_makes_better_humans'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.font22DarkBold,
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'onboarding_subtitle'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.font14GreyRegular,
          ),
        ),
      ],
    );
  }
}
