import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedIllustration extends StatelessWidget {
  const CompletedIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/otp_compl.png',
      width: 190.w,
      fit: BoxFit.contain,
    );
  }
}
