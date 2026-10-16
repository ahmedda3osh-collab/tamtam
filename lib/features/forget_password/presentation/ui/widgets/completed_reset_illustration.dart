import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedResetIllustration extends StatelessWidget {
  const CompletedResetIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Completed_Reset_logo.png',
      width: 130.w,
      height: 130.w,
      fit: BoxFit.contain,
    );
  }
}
