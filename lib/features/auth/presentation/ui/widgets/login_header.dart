import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'come_and_join_us'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.font22DarkBold,
        ),
        SizedBox(height: 6.h),
        Text(
          'we_are_pleased'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.font14GreyRegular,
        ),
      ],
    );
  }
}
