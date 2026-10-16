import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/features/language_screen/presentation/ui/widgets/language_option_item.dart';

class LanguageOptionsList extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguageOptionsList({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  static const List<Map<String, String>> languages = [
    {'code': 'en', 'title': 'English'},
    {'code': 'ar', 'title': 'Arabic'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: languages.map((lang) {
        final isSelected = lang['code'] == selectedLanguage;
        return Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: LanguageOptionItem(
            title: lang['title']!,
            isSelected: isSelected,
            onTap: () => onLanguageSelected(lang['code']!),
          ),
        );
      }).toList(),
    );
  }
}
