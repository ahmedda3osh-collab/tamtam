import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/helpers/app_validators.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/custom_auth_text_field.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_cubit.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_state.dart';
import 'package:tamtam/features/forget_password/presentation/ui/widgets/create_new_password_header.dart';

class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({super.key});

  @override
  State<CreateNewPasswordBody> createState() => _CreateNewPasswordBodyState();
}

class _CreateNewPasswordBodyState extends State<CreateNewPasswordBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgetPasswordCubit>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48.h),
                  const CreateNewPasswordHeader(),
                  SizedBox(height: 40.h),
                  CustomAuthTextField(
                    label: 'new_password'.tr(),
                    hintText: 'enter_your_password'.tr(),
                    controller: _newPasswordController,
                    isObscure: cubit.isNewPasswordObscure,
                    validator: AppValidators.validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.isNewPasswordObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.primaryBlue,
                        size: 20.sp,
                      ),
                      onPressed: cubit.toggleNewPasswordVisibility,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomAuthTextField(
                    label: 'confirm_password'.tr(),
                    hintText: 'confirm_your_password'.tr(),
                    controller: _confirmPasswordController,
                    isObscure: cubit.isConfirmPasswordObscure,
                    validator: (val) => AppValidators.validateConfirmPassword(
                      val,
                      _newPasswordController.text,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.isConfirmPasswordObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.primaryBlue,
                        size: 20.sp,
                      ),
                      onPressed: cubit.toggleConfirmPasswordVisibility,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      final isLoading = state is ResetPasswordLoading;
                      return SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    cubit.resetPassword(
                                      newPassword: _newPasswordController.text,
                                      confirmPassword:
                                          _confirmPasswordController.text,
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            disabledBackgroundColor: AppColors.primaryBlue
                                .withValues(alpha: 0.6),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.r),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: isLoading
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : Text(
                                  'reset_password'.tr(),
                                  style: AppTextStyles.font16WhiteSemiBold,
                                ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
