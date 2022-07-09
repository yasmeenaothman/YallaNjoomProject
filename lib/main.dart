import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/home_page.dart';
import 'package:yalla_njoom/models/dummy_data.dart';
import 'package:yalla_njoom/models/example.dart';
import 'package:yalla_njoom/models/kid.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/add_child_info_screen.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/screens/child_tracker_screen.dart';
import 'package:yalla_njoom/screens/display_number_screen.dart';
import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';
import 'package:yalla_njoom/screens/edit_child_profile_screen.dart';
import 'package:yalla_njoom/screens/enter_your_code_screen.dart';
import 'package:yalla_njoom/screens/examples_screen.dart';
import 'package:yalla_njoom/screens/exercises_screen.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/music_screen.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';
import 'package:yalla_njoom/screens/operation_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/screens/splash_screen.dart';
import 'package:yalla_njoom/screens/user_type_screen.dart';
import 'package:yalla_njoom/screens/user_code_screen.dart';

import 'screens/example_numbers_bg.dart';

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
        ChildHomeScreen.routeName: (context) => const ChildHomeScreen(),
        ChildTrackerScreen.routeName: (context) => const ChildTrackerScreen(),
        LettersScreen.routeName: (context) => const LettersScreen(),
        NumbersScreen.routeName: (context) => const NumbersScreen(),
        LetterCardScreen.routeName: (context) => const LetterCardScreen(),
        ExamplesScreen.routeName: (context) => const ExamplesScreen(),
        MusicScreen.routeName: (context) => const MusicScreen(),
        OperationScreen.routeName: (context) => const OperationScreen(),
        ExampleNumbers.routeName: (context) => const ExampleNumbers(),
      },
      onGenerateRoute: (routeSettings) {
        String? name = routeSettings.name;
        var arguments = routeSettings.arguments;
        return MaterialPageRoute(builder: (context) {
          if (name == BravoScreen.routeName) {
            return BravoScreen(
              isPronunciationWidget: arguments as bool,
            );
          } else if (name == DisplayNumberScreen.routeName) {
            return DisplayNumberScreen(imageUrl: arguments as String);
          } else if (name == EditKidProfile.routeName) {
            return EditKidProfile(kid: arguments as Kid);
          } else if (name == ExercisesScreen.routeName) {
            return ExercisesScreen(examples: arguments as List<Example>);
          } else if (name == ExamplesScreen.routeName) {
            return const ExampleNumbers();
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
