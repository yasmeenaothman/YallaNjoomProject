import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/home_page.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/add_child_info_screen.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';
import 'package:yalla_njoom/screens/enter_your_code_screen.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/screens/splash_screen.dart';
import 'package:yalla_njoom/screens/user_type_screen.dart';
import 'package:yalla_njoom/screens/user_code_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      builder: (context, child) {
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
      theme: _buildThemeData(),
      navigatorKey: AppRouter.router.routerKey,
      routes: {
        '/': (context) => const SplashScreen(),
        MyHomePage.routeName: (context) => const MyHomePage(),
        UserCodeScreen.routeName: (context) => const UserCodeScreen(),
        ParentsHomeScreen.routeName: (context) => const ParentsHomeScreen(),
        EnterYourCodeScreen.routeName: (context) => const EnterYourCodeScreen(),
        AddChildInfoScreen.routeName: (context) => const AddChildInfoScreen(),
        UserTypeScreen.routeName: (context) => const UserTypeScreen(),
        DoYouHaveAccScreen.routeName: (context) => const DoYouHaveAccScreen(),
        ChildHomeScreen.routeName: (context) => const ChildHomeScreen()
      },
      onGenerateRoute: (routeSettings) {
        String? name = routeSettings.name;
        var arguments = routeSettings.arguments;
        return MaterialPageRoute(builder: (context) {
          if (name == BravoScreen.routeName) {
            return BravoScreen(
              isPronunciationWidget: arguments as bool,
            );
          } else {
            return const Scaffold(
              body: Text('ERROR 404!'),
            );
          }
        });
      },
    );
  }

  ThemeData _buildThemeData() {
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
