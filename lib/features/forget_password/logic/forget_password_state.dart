abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class SendCodeLoading extends ForgetPasswordState {}

class SendCodeSuccess extends ForgetPasswordState {
  final String phone;
  SendCodeSuccess(this.phone);
}

class SendCodeError extends ForgetPasswordState {
  final String message;
  SendCodeError(this.message);
}

class VerifyResetOtpLoading extends ForgetPasswordState {}

class VerifyResetOtpSuccess extends ForgetPasswordState {}

class VerifyResetOtpError extends ForgetPasswordState {
  final String message;
  VerifyResetOtpError(this.message);
}

class ResetPasswordLoading extends ForgetPasswordState {}

class ResetPasswordSuccess extends ForgetPasswordState {}

class ResetPasswordError extends ForgetPasswordState {
  final String message;
  ResetPasswordError(this.message);
}

class ResetPasswordVisibilityChanged extends ForgetPasswordState {
  final bool isNewPasswordObscure;
  final bool isConfirmPasswordObscure;

  ResetPasswordVisibilityChanged({
    required this.isNewPasswordObscure,
    required this.isConfirmPasswordObscure,
  });
}
