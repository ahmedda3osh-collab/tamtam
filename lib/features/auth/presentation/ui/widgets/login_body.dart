import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/core/theme/app_text_styles.dart';
import 'package:tamtam/features/auth/logic/auth_cubit.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_form.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_header.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_illustration.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_tabs.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_terms_text.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/sign_up_form.dart';
import 'package:tamtam/features/forget_password/presentation/ui/forget_password_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _loginFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _dobController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AuthCubit>();
    _nameController = TextEditingController();
    _dobController = TextEditingController();
    _phoneController = TextEditingController(text: cubit.currentPhone);
    _emailController = TextEditingController();
    _passwordController = TextEditingController(text: cubit.currentPassword);
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 10, now.month, now.day),
      firstDate: DateTime(1950),
      lastDate: now,
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    final isLoginTab = cubit.selectedTabIndex == 0;

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
          stops: [0.0, 0.35, 1.0],
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
                SizedBox(height: 14.h),
                const LoginIllustration(),
                SizedBox(height: 14.h),
                const LoginHeader(),
                SizedBox(height: 18.h),
                LoginTabs(
                  selectedIndex: cubit.selectedTabIndex,
                  onTabChanged: cubit.switchTab,
                ),
                SizedBox(height: 22.h),
                if (isLoginTab)
                  LoginForm(
                    formKey: _loginFormKey,
                    phoneController: _phoneController,
                    passwordController: _passwordController,
                    isPasswordObscure: cubit.isPasswordObscure,
                    onTogglePasswordVisibility: cubit.togglePasswordVisibility,
                    onForgotPassword: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ForgetPasswordScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  )
                else
                  SignUpForm(
                    formKey: _signUpFormKey,
                    nameController: _nameController,
                    dobController: _dobController,
                    phoneController: _phoneController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    isPasswordObscure: cubit.isPasswordObscure,
                    isConfirmPasswordObscure: cubit.isConfirmPasswordObscure,
                    onTogglePasswordVisibility: cubit.togglePasswordVisibility,
                    onToggleConfirmPasswordVisibility:
                        cubit.toggleConfirmPasswordVisibility,
                    onSelectDate: _selectDate,
                  ),
                SizedBox(height: 28.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = isLoginTab
                        ? state is LoginLoading
                        : state is SignUpLoading;

                    return SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (isLoginTab) {
                                  if (_loginFormKey.currentState?.validate() ??
                                      false) {
                                    cubit.login(
                                      phone: _phoneController.text,
                                      password: _passwordController.text,
                                    );
                                  }
                                } else {
                                  if (_signUpFormKey.currentState?.validate() ??
                                      false) {
                                    cubit.signUp(
                                      name: _nameController.text,
                                      dob: _dobController.text,
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      confirmPassword:
                                          _confirmPasswordController.text,
                                    );
                                  }
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
                                isLoginTab ? 'login'.tr() : 'sign_up'.tr(),
                                style: AppTextStyles.font16WhiteSemiBold,
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                if (isLoginTab) const LoginTermsText(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
