import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'forget_password_title'.tr(),
          style: AppTextStyles.font24DarkBold,
        ),
        SizedBox(height: 12.h),
        Text(
          'forget_password_subtitle'.tr(),
          style: AppTextStyles.font14GreyRegular,
        ),
      ],
    );
  }
}
