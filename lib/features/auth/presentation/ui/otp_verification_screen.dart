import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamtam/features/auth/logic/auth_cubit.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';
import 'package:tamtam/features/auth/presentation/ui/completed_screen.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/otp_body.dart';

class OtpVerificationScreen extends StatelessWidget {
  final AuthCubit? cubit;

  const OtpVerificationScreen({
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
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const CompletedScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          } else if (state is OtpError) {
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
          body: OtpBody(),
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
      create: (context) => AuthCubit(),
      child: screenContent,
    );
  }
}
