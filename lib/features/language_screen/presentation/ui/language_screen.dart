import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamtam/features/auth/presentation/ui/login_screen.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_body.dart';

class LanguageScreen extends StatelessWidget {
  final VoidCallback? onContinuePressed;

  const LanguageScreen({
    super.key,
    this.onContinuePressed,
  });

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
        body: LanguageBody(
          onContinuePressed: onContinuePressed ??
              () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
        ),
      ),
    );
  }
}
