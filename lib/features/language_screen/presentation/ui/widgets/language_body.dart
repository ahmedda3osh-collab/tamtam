import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_action_button.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_content.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_illustration.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_options_list.dart';

class LanguageBody extends StatefulWidget {
  final VoidCallback? onContinuePressed;

  const LanguageBody({
    super.key,
    this.onContinuePressed,
  });

  @override
  State<LanguageBody> createState() => _LanguageBodyState();
}

class _LanguageBodyState extends State<LanguageBody> {
  String _selectedLanguage = 'en';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentCode = context.locale.languageCode;
    if (currentCode == 'ar' || currentCode == 'en') {
      _selectedLanguage = currentCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientTopYellow,
            AppColors.white,
            AppColors.white,
          ],
          stops: [0.0, 0.40, 1.0],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 36.h),
                const LanguageIllustration(),
                SizedBox(height: 36.h),
                const LanguageContent(),
                SizedBox(height: 28.h),
                LanguageOptionsList(
                  selectedLanguage: _selectedLanguage,
                  onLanguageSelected: (code) {
                    setState(() {
                      _selectedLanguage = code;
                    });
                  },
                ),
                SizedBox(height: 36.h),
                LanguageActionButton(
                  onPressed: () async {
                    if (context.locale.languageCode != _selectedLanguage) {
                      await context.setLocale(Locale(_selectedLanguage));
                    }
                    widget.onContinuePressed?.call();
                  },
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
