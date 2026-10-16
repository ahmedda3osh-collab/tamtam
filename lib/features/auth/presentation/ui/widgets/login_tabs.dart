import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';

class LoginTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const LoginTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTab(
          title: 'login'.tr(),
          isSelected: selectedIndex == 0,
          onTap: () => onTabChanged(0),
        ),
        SizedBox(width: 14.w),
        _buildTab(
          title: 'sign_up'.tr(),
          isSelected: selectedIndex == 1,
          onTap: () => onTabChanged(1),
        ),
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 114.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(21.r),
        border: Border.all(
          color: isSelected ? AppColors.primaryBlue : AppColors.borderGrey,
          width: isSelected ? 1.5.w : 1.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(21.r),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: isSelected
                  ? AppTextStyles.font14BlueMedium
                  : AppTextStyles.font14GreyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
