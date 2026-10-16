import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class LoginTermsText extends StatelessWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onConditionsTap;

  const LoginTermsText({
    super.key,
    this.onTermsTap,
    this.onConditionsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text.rich(
        TextSpan(
          text: 'terms_prefix'.tr(),
          style: AppTextStyles.font12GreyRegular,
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: onTermsTap ?? () {},
                child: Text(
                  'terms'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ),
            TextSpan(
              text: 'and'.tr(),
              style: AppTextStyles.font12GreyRegular,
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: onConditionsTap ?? () {},
                child: Text(
                  'conditions'.tr(),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
