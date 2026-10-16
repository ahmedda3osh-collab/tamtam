import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/core/helpers/cache_helper.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  String phoneNumber = '';
  String otpCode = '';
  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  void toggleNewPasswordVisibility() {
    isNewPasswordObscure = !isNewPasswordObscure;
    emit(ResetPasswordVisibilityChanged(
      isNewPasswordObscure: isNewPasswordObscure,
      isConfirmPasswordObscure: isConfirmPasswordObscure,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(ResetPasswordVisibilityChanged(
      isNewPasswordObscure: isNewPasswordObscure,
      isConfirmPasswordObscure: isConfirmPasswordObscure,
    ));
  }

  Future<void> sendCode(String phone) async {
    final trimmedPhone = phone.trim();
    if (trimmedPhone.isEmpty) {
      emit(SendCodeError('phone_empty'));
      return;
    }

    emit(SendCodeLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    phoneNumber = trimmedPhone;
    await CacheHelper.saveData(key: 'reset_phone', value: trimmedPhone);

    emit(SendCodeSuccess(trimmedPhone));
  }

  void updateOtp(String code) {
    otpCode = code;
  }

  Future<void> verifyOtp([String? code]) async {
    final finalCode = code ?? otpCode;
    if (finalCode.length < 4) {
      emit(VerifyResetOtpError('otp_incomplete'));
      return;
    }

    emit(VerifyResetOtpLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    emit(VerifyResetOtpSuccess());
  }

  Future<void> resendCode() async {
    emit(VerifyResetOtpLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(SendCodeSuccess(phoneNumber));
  }

  Future<void> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword.isEmpty) {
      emit(ResetPasswordError('password_empty'));
      return;
    }
    if (confirmPassword.isEmpty) {
      emit(ResetPasswordError('confirm_password_empty'));
      return;
    }
    if (newPassword != confirmPassword) {
      emit(ResetPasswordError('passwords_do_not_match'));
      return;
    }

    emit(ResetPasswordLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    // Persist new password and state to Local Storage
    await CacheHelper.saveData(key: 'user_password', value: newPassword);
    await CacheHelper.saveData(key: 'password_reset_completed', value: true);

    emit(ResetPasswordSuccess());
  }
}
