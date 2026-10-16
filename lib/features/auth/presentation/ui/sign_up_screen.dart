import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/features/auth/logic/auth_cubit.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';
import 'package:tamtam/features/auth/presentation/ui/otp_verification_screen.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/login_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.switchTab(1); // Set to Sign up tab
        return cubit;
      },
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
                if (state is SignUpSuccess || state is LoginSuccess) {
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
                } else if (state is SignUpError) {
                  String errorText = state.message;
                  if (state.message == 'name_empty' ||
                      state.message == 'name_required') {
                    errorText = 'name_required'.tr();
                  } else if (state.message == 'phone_empty' ||
                      state.message == 'phone_required') {
                    errorText = 'phone_required'.tr();
                  } else if (state.message == 'password_empty' ||
                      state.message == 'password_required') {
                    errorText = 'password_required'.tr();
                  } else if (state.message == 'confirm_password_empty' ||
                      state.message == 'confirm_password_required') {
                    errorText = 'confirm_password_required'.tr();
                  } else if (state.message == 'passwords_do_not_match') {
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
