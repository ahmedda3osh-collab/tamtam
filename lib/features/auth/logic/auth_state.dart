abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthTabChanged extends AuthState {
  final int selectedIndex;
  AuthTabChanged(this.selectedIndex);
}

class PasswordVisibilityChanged extends AuthState {
  final bool isObscure;
  PasswordVisibilityChanged(this.isObscure);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String phone;
  LoginSuccess(this.phone);
}

class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final String phone;
  SignUpSuccess(this.phone);
}

class SignUpError extends AuthState {
  final String message;
  SignUpError(this.message);
}

class OtpCodeChanged extends AuthState {
  final String code;
  OtpCodeChanged(this.code);
}

class OtpLoading extends AuthState {}

class OtpSuccess extends AuthState {}

class OtpError extends AuthState {
  final String message;
  OtpError(this.message);
}

class OtpResentSuccess extends AuthState {}
