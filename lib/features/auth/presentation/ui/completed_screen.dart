import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/completed_body.dart';

class CompletedScreen extends StatelessWidget {
  final VoidCallback? onGetStarted;

  const CompletedScreen({
    super.key,
    this.onGetStarted,
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
        body: CompletedBody(
          onGetStarted: onGetStarted ??
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Welcome to TamTam!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
        ),
      ),
    );
  }
}
