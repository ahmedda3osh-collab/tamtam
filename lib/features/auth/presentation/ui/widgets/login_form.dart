import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/helpers/app_validators.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/custom_auth_text_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final bool isPasswordObscure;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback? onForgotPassword;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.passwordController,
    required this.isPasswordObscure,
    required this.onTogglePasswordVisibility,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAuthTextField(
            label: 'phone_number'.tr(),
            hintText: 'enter_phone_number'.tr(),
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: AppValidators.validatePhone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 16.h),
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
          SizedBox(height: 10.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: onForgotPassword ?? () {},
              child: Text(
                'forget_password'.tr(),
                style: AppTextStyles.font12BlueMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
