import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/helpers/app_validators.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/custom_auth_text_field.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onToggleConfirmPasswordVisibility;
  final VoidCallback onSelectDate;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.dobController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isPasswordObscure,
    required this.isConfirmPasswordObscure,
    required this.onTogglePasswordVisibility,
    required this.onToggleConfirmPasswordVisibility,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAuthTextField(
            label: 'name'.tr(),
            hintText: 'enter_your_name'.tr(),
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: AppValidators.validateName,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'date_of_birth'.tr(),
                style: AppTextStyles.font14DarkSemiBold,
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: onSelectDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: dobController,
                    validator: AppValidators.validateDateOfBirth,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: AppTextStyles.font14DarkRegular,
                    decoration: InputDecoration(
                      hintText: '14/8/2025',
                      hintStyle: AppTextStyles.font14HintRegular,
                      filled: true,
                      fillColor: AppColors.fieldBackground,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.primaryBlue,
                        size: 20.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.fieldBorder,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.fieldBorder,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1.2.w,
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          CustomAuthTextField(
            label: 'phone_number'.tr(),
            hintText: 'enter_phone_number'.tr(),
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: AppValidators.validatePhone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          CustomAuthTextField(
            label: 'email'.tr(),
            hintText: 'enter_your_email'.tr(),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          CustomAuthTextField(
            label: 'password'.tr(),
            hintText: 'enter_your_password'.tr(),
            controller: passwordController,
            isObscure: isPasswordObscure,
            validator: AppValidators.validatePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.primaryBlue,
                size: 20.sp,
              ),
              onPressed: onTogglePasswordVisibility,
            ),
          ),
          SizedBox(height: 14.h),
          CustomAuthTextField(
            label: 'confirm_password'.tr(),
            hintText: 'enter_your_password'.tr(),
            controller: confirmPasswordController,
            isObscure: isConfirmPasswordObscure,
            validator: (val) => AppValidators.validateConfirmPassword(
              val,
              passwordController.text,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            suffixIcon: IconButton(
              icon: Icon(
                isConfirmPasswordObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.primaryBlue,
                size: 20.sp,
              ),
              onPressed: onToggleConfirmPasswordVisibility,
            ),
          ),
        ],
      ),
    );
  }
}
