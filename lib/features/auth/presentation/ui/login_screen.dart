import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/features/auth/logic/auth_cubit.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';
import 'package:tamtam/features/auth/presentation/ui/otp_verification_screen.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess || state is SignUpSuccess) {
                  final cubit = context.read<AuthCubit>();
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          OtpVerificationScreen(cubit: cubit),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                } else if (state is LoginError || state is SignUpError) {
                  final message = state is LoginError
                      ? state.message
                      : (state as SignUpError).message;
                  String errorText = message;
                  if (message == 'phone_empty' || message == 'phone_required') {
                    errorText = 'phone_required'.tr();
                  } else if (message == 'password_empty' ||
                      message == 'password_required') {
                    errorText = 'password_required'.tr();
                  } else if (message == 'name_empty' ||
                      message == 'name_required') {
                    errorText = 'name_required'.tr();
                  } else if (message == 'confirm_password_empty' ||
                      message == 'confirm_password_required') {
                    errorText = 'confirm_password_required'.tr();
                  } else if (message == 'passwords_do_not_match') {
                    errorText = 'passwords_do_not_match'.tr();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorText),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              child: const Scaffold(
                backgroundColor: Colors.white,
                body: LoginBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
