import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/completed_action_button.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/completed_content.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/completed_illustration.dart';

class CompletedBody extends StatelessWidget {
  final VoidCallback onGetStarted;

  const CompletedBody({
    super.key,
    required this.onGetStarted,
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
                const CompletedTitle(),
                SizedBox(height: 56.h),
                const CompletedIllustration(),
                SizedBox(height: 60.h),
                const CompletedSubtitle(),
                SizedBox(height: 56.h),
                CompletedActionButton(
                  onPressed: onGetStarted,
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
