import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class OtpResendText extends StatelessWidget {
  final VoidCallback onResend;

  const OtpResendText({
    super.key,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'didnt_receive_code'.tr(),
            style: AppTextStyles.font12GreyRegular,
          ),
          GestureDetector(
            onTap: onResend,
            child: Text(
              'resend'.tr(),
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
