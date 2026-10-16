import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextPageIllustration extends StatelessWidget {
  const NextPageIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/next_page_logo.png',
      width: 330.w,
      fit: BoxFit.contain,
    );
  }
}
