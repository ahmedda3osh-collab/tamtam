import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_cubit.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_state.dart';
import 'package:tamtam/features/forget_password/presentation/ui/create_new_password_screen.dart';
import 'package:tamtam/features/forget_password/presentation/ui/widgets/reset_password_otp_body.dart';

class ResetPasswordOtpScreen extends StatelessWidget {
  final ForgetPasswordCubit? cubit;

  const ResetPasswordOtpScreen({
    super.key,
    this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final screenContent = AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is VerifyResetOtpSuccess) {
            final activeCubit = context.read<ForgetPasswordCubit>();
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreateNewPasswordScreen(cubit: activeCubit),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          } else if (state is VerifyResetOtpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message == 'otp_incomplete'
                      ? 'Please enter 4 digits code'
                      : state.message,
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: ResetPasswordOtpBody(),
        ),
      ),
    );

    if (cubit != null) {
      return BlocProvider.value(
        value: cubit!,
        child: screenContent,
      );
    }

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: screenContent,
    );
  }
}
