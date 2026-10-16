import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_cubit.dart';
import 'package:tamtam/features/forget_password/logic/forget_password_state.dart';
import 'package:tamtam/features/forget_password/presentation/ui/completed_reset_screen.dart';
import 'package:tamtam/features/forget_password/presentation/ui/widgets/create_new_password_body.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final ForgetPasswordCubit? cubit;

  const CreateNewPasswordScreen({
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
          if (state is ResetPasswordSuccess) {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const CompletedResetScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          } else if (state is ResetPasswordError) {
            String message = state.message;
            if (state.message == 'password_empty') {
              message = 'Please enter a new password';
            } else if (state.message == 'confirm_password_empty') {
              message = 'Please confirm your new password';
            } else if (state.message == 'passwords_do_not_match') {
              message = 'Passwords do not match';
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: CreateNewPasswordBody(),
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
