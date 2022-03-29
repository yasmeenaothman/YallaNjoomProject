import 'package:flutter/material.dart';
import 'package:yalla_njoom/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      builder: () {
        return const MyApp();
      },
      designSize: const Size(375, 812),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const primaryColor = Color(0xFF074785);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData(),
      home: const MyHomePage(),
    );
  }

  ThemeData appThemeData() {
    return ThemeData(
      fontFamily: 'Tajawal',
      primaryColor: primaryColor,
      colorScheme:
          ThemeData().colorScheme.copyWith(secondary: const Color(0xFFD8EBF7)),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(
                color: primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
            headline2: TextStyle(
                color: primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
            headline3: TextStyle(
              color: primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            subtitle1: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
    );
  }
}
