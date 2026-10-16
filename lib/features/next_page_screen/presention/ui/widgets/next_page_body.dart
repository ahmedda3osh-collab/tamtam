import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/features/next_page_screen/presention/ui/widgets/next_page_action_button.dart';
import 'package:tamtam/features/next_page_screen/presention/ui/widgets/next_page_content.dart';
import 'package:tamtam/features/next_page_screen/presention/ui/widgets/next_page_illustration.dart';

class NextPageBody extends StatelessWidget {
  final VoidCallback? onNextPressed;

  const NextPageBody({
    super.key,
    this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientTopYellow,
            AppColors.white,
            AppColors.white,
          ],
          stops: [0.0, 0.40, 1.0],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48.h),
                const NextPageIllustration(),
                SizedBox(height: 38.h),
                const NextPageContent(),
                SizedBox(height: 80.h),
                NextPageActionButton(
                  onPressed: onNextPressed,
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
