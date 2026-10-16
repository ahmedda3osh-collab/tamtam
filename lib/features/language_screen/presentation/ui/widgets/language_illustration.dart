import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageIllustration extends StatelessWidget {
  const LanguageIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/language_logo.png',
      width: 320.w,
      fit: BoxFit.contain,
    );
  }
}
