import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';
import 'package:tamtam/features/forget_password/presentation/ui/widgets/completed_reset_illustration.dart';

class CompletedResetBody extends StatelessWidget {
  final VoidCallback onBackToLogin;

  const CompletedResetBody({
    super.key,
    required this.onBackToLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                Text(
                  'reset_password_is_done'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font22DarkBold,
                ),
                SizedBox(height: 60.h),
                const CompletedResetIllustration(),
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'password_changed_successfully'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14GreyRegular,
                  ),
                ),
                SizedBox(height: 60.h),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: onBackToLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'back_to_login'.tr(),
                      style: AppTextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
