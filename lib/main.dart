// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/models/example.dart';
// import 'package:yalla_njoom/models/user_model.dart';
// import 'package:yalla_njoom/providers/firestore_provider.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/add_child_info_screen.dart';
// import 'package:yalla_njoom/screens/bravo_screen.dart';
// import 'package:yalla_njoom/screens/child_home_screen.dart';
// import 'package:yalla_njoom/screens/child_tracker_screen.dart';
// import 'package:yalla_njoom/screens/display_number_screen.dart';
// import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';
// import 'package:yalla_njoom/screens/edit_child_profile_screen.dart';
// import 'package:yalla_njoom/screens/enter_your_code_screen.dart';
// import 'package:yalla_njoom/screens/examples_screen.dart';
// import 'package:yalla_njoom/screens/exercises_screen.dart';
// import 'package:yalla_njoom/screens/games_screen.dart';
// import 'package:yalla_njoom/screens/letter_card_screen.dart';
// import 'package:yalla_njoom/screens/letters_screen.dart';
// import 'package:yalla_njoom/screens/music_screen.dart';
// import 'package:yalla_njoom/screens/numbers_screen.dart';
// import 'package:yalla_njoom/screens/operation_screen.dart';
// import 'package:yalla_njoom/screens/parents_home_screen.dart';
// import 'package:yalla_njoom/screens/splash_screen.dart';
// import 'package:yalla_njoom/screens/user_type_screen.dart';
// import 'package:yalla_njoom/screens/videos_screen.dart';
// import 'screens/example_numbers_bg.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     ChangeNotifierProvider<FirestoreProvider>(
//       create: (context) => FirestoreProvider(),
//       child: ScreenUtilInit(
//         builder: (context, child) {
//           return const MyApp();
//         },
//         designSize: const Size(375, 812),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   static const primaryColor = Color(0xFF074785);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: _buildThemeData(),
//       navigatorKey: AppRouter.router.routerKey,
//       routes: {
//         '/': (context) => FirebaseConfiguration(),
//         EnterYourCodeScreen.routeName: (context) => const EnterYourCodeScreen(),
//         AddChildInfoScreen.routeName: (context) => AddChildInfoScreen(),
//         UserTypeScreen.routeName: (context) => const UserTypeScreen(),
//         DoYouHaveAccScreen.routeName: (context) => const DoYouHaveAccScreen(),
//         ChildTrackerScreen.routeName: (context) => const ChildTrackerScreen(),
//         LettersScreen.routeName: (context) => const LettersScreen(),
//         NumbersScreen.routeName: (context) => const NumbersScreen(),
//         LetterCardScreen.routeName: (context) => const LetterCardScreen(),
//         ExamplesScreen.routeName: (context) => const ExamplesScreen(),
//         MusicScreen.routeName: (context) => const MusicScreen(),
//         OperationScreen.routeName: (context) => const OperationScreen(),
//         ExampleNumbers.routeName: (context) => const ExampleNumbers(),
//         ParentsHomeScreen.routeName: (context) => const ParentsHomeScreen(),
//         VideosScreen.routeName: (context) => const VideosScreen(),
//         GamesScreen.routeName: (context) => GamesScreen()
//       },
//       onGenerateRoute: (routeSettings) {
//         String? name = routeSettings.name;
//         var arguments = routeSettings.arguments;
//         return MaterialPageRoute(builder: (context) {
//           if (name == BravoScreen.routeName) {
//             return BravoScreen(
//               isPronunciationWidget: (arguments as List)[0] as bool,
//               onPressed: arguments[1] as Function(),
//             );
//           } else if (name == DisplayNumberScreen.routeName) {
//             return DisplayNumberScreen(imageUrl: arguments as String);
//           } else if (name == ChildHomeScreen.routeName) {
//             return ChildHomeScreen(childModel: arguments as ChildModel);
//           } else if (name == EditChildProfile.routeName) {
//             return EditChildProfile(childModel: arguments as ChildModel);
//           } else if (name == ExercisesScreen.routeName) {
//             return ExercisesScreen(examples: arguments as List<Example>);
//           } else if (name == ExamplesScreen.routeName) {
//             return const ExampleNumbers();
//           } else {
//             return const Scaffold(
//               body: Text('ERROR 404!'),
//             );
//           }
//         });
//       },
//     );
//   }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/screens/test.dart';

import 'providers/firestore_provider.dart';
import 'routers/app_router.dart';
import 'screens/add_child_info_screen.dart';
import 'screens/bravo_screen.dart';
import 'screens/child_home_screen.dart';
import 'screens/child_tracker_screen.dart';
import 'screens/display_number_screen.dart';
import 'screens/do_u_have_acc_screen.dart';
import 'screens/edit_child_profile_screen.dart';
import 'screens/enter_your_code_screen.dart';
import 'screens/example_numbers_bg.dart';
import 'screens/examples_screen.dart';
import 'screens/exercises_screen.dart';
import 'screens/games_screen.dart';
import 'screens/letter_card_screen.dart';
import 'screens/letters_screen.dart';
import 'screens/music_screen.dart';
import 'screens/numbers_screen.dart';
import 'screens/operation_screen.dart';
import 'screens/parents_home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_type_screen.dart';
import 'screens/videos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<FirestoreProvider>(
      create: (context) => FirestoreProvider(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return const MyApp();
        },
        designSize: const Size(375, 812),
      ),
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
        '/': (context) => FirebaseConfiguration(),
        EnterYourCodeScreen.routeName: (context) => const EnterYourCodeScreen(),
        AddChildInfoScreen.routeName: (context) => AddChildInfoScreen(),
        UserTypeScreen.routeName: (context) => const UserTypeScreen(),
        DoYouHaveAccScreen.routeName: (context) => const DoYouHaveAccScreen(),
        ChildTrackerScreen.routeName: (context) => const ChildTrackerScreen(),
        LettersScreen.routeName: (context) => LettersScreen(),
        NumbersScreen.routeName: (context) => NumbersScreen(),
        LetterCardScreen.routeName: (context) => const LetterCardScreen(),
        ExamplesScreen.routeName: (context) => ExamplesScreen(),
        MusicScreen.routeName: (context) => const MusicScreen(),
        OperationScreen.routeName: (context) => const OperationScreen(),
        ExampleNumbers.routeName: (context) => ExampleNumbers(),
        GamesScreen.routeName: (context) => GamesScreen(),
        ChildHomeScreen.routeName: (context) => const ChildHomeScreen(),
        VideosScreen.routeName: (context) => const VideosScreen(),
        ParentsHomeScreen.routeName: (context) => const ParentsHomeScreen(),
        EditChildProfile.routeName: (context) => EditChildProfile(),
        DisplayNumberScreen.routeName: (context) => DisplayNumberScreen()
      },
      onGenerateRoute: (routeSettings) {
        String? name = routeSettings.name;
        var arguments = routeSettings.arguments;
        return MaterialPageRoute(builder: (context) {
          if (name == BravoScreen.routeName) {
            return BravoScreen(
              lastExample: (arguments as List)[0] as bool,
              isPronunciationWidget: (arguments as List)[1] as bool,
              onPressed: arguments[2] as Function(),
              onTab: arguments[3] as Function(),
            );
          } else if (name == ExercisesScreen.routeName) {
            return ExercisesScreen(
              isSum: (arguments as List)[0] as bool,
              isMix: arguments[1] as bool,
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

class FirebaseConfiguration extends StatelessWidget {
  const FirebaseConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const SplashScreen();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
      future: Firebase.initializeApp(),
    );
  }
}
