import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tamtam/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/features/splash/presentation/ui/splash_screen.dart';

class TamTam extends StatelessWidget {
  const TamTam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
