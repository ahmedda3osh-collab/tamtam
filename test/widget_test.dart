import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamtam/features/next_page_screen/presention/ui/next_page_screen.dart';

void main() {
  testWidgets('NextPageScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) => const MaterialApp(
          home: NextPageScreen(),
        ),
      ),
    );
    expect(find.byType(NextPageScreen), findsOneWidget);
  });
}
