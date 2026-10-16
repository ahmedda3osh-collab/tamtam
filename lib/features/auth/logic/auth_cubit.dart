import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/core/helpers/cache_helper.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  int selectedTabIndex = 0; // 0 = Login, 1 = Sign up
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  String currentPhone = '';
  String currentPassword = '';
  String otpCode = '';

  void switchTab(int index) {
    selectedTabIndex = index;
    emit(AuthTabChanged(selectedTabIndex));
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(PasswordVisibilityChanged(isPasswordObscure));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(PasswordVisibilityChanged(isConfirmPasswordObscure));
  }

  void updatePhone(String phone) {
    currentPhone = phone.trim();
  }

  void updatePassword(String password) {
    currentPassword = password;
  }

  Future<void> login({String? phone, String? password}) async {
    final finalPhone = phone?.trim() ?? currentPhone;
    final finalPassword = password ?? currentPassword;

    if (finalPhone.isEmpty) {
      emit(LoginError('phone_empty'));
      return;
    }
    if (finalPassword.isEmpty) {
      emit(LoginError('password_empty'));
      return;
    }

    emit(LoginLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    // Persist phone to Local Storage
    await CacheHelper.saveUserPhone(finalPhone);
    currentPhone = finalPhone;

    emit(LoginSuccess(finalPhone));
  }

  Future<void> signUp({
    required String name,
    required String dob,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final trimmedName = name.trim();
    final trimmedPhone = phone.trim();
    final trimmedEmail = email.trim();

    if (trimmedName.isEmpty) {
      emit(SignUpError('name_empty'));
      return;
    }
    if (trimmedPhone.isEmpty) {
      emit(SignUpError('phone_empty'));
      return;
    }
    if (password.isEmpty) {
      emit(SignUpError('password_empty'));
      return;
    }
    if (confirmPassword.isEmpty) {
      emit(SignUpError('confirm_password_empty'));
      return;
    }
    if (password != confirmPassword) {
      emit(SignUpError('passwords_do_not_match'));
      return;
    }

    emit(SignUpLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    // Persist user data in Local Storage
    await CacheHelper.saveData(key: 'user_name', value: trimmedName);
    await CacheHelper.saveData(key: 'user_dob', value: dob);
    await CacheHelper.saveUserPhone(trimmedPhone);
    await CacheHelper.saveData(key: 'user_email', value: trimmedEmail);
    await CacheHelper.saveData(key: 'user_password', value: password);

    currentPhone = trimmedPhone;

    emit(SignUpSuccess(trimmedPhone));
  }

  void updateOtp(String code) {
    otpCode = code;
    emit(OtpCodeChanged(code));
  }

  Future<void> verifyOtp([String? code]) async {
    final finalCode = code ?? otpCode;
    if (finalCode.length < 4) {
      emit(OtpError('otp_incomplete'));
      return;
    }

    emit(OtpLoading());
    await Future.delayed(const Duration(milliseconds: 600));

    // Persist login state to Local Storage
    await CacheHelper.setLoggedIn(true);

    emit(OtpSuccess());
  }

  Future<void> resendOtp() async {
    emit(OtpLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(OtpResentSuccess());
  }
}
