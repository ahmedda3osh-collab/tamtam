import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamtam/features/auth/presentation/ui/login_screen.dart';
import 'package:tamtam/features/forget_password/presentation/ui/widgets/completed_reset_body.dart';

class CompletedResetScreen extends StatelessWidget {
  const CompletedResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CompletedResetBody(
          onBackToLogin: () {
            Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
