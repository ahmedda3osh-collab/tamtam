import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'otp_verification'.tr(),
          style: AppTextStyles.font24DarkBold,
        ),
        SizedBox(height: 12.h),
        Text(
          'otp_subtitle'.tr(),
          style: AppTextStyles.font14GreyRegular,
        ),
      ],
    );
  }
}
