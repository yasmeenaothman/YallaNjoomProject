import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/examples_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
import 'package:yalla_njoom/widgets/letter_cart_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';

class LetterCardScreen extends StatelessWidget {
  const LetterCardScreen({Key? key}) : super(key: key);
  static const String routeName = 'LetterCardScreen';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Align(
                alignment: Alignment.centerLeft,
                child: DefaultCirculeAvatar(
                  onTap: () => AppRouter.router
                      .pushNamedWithReplacementFunction(
                          LettersScreen.routeName),
                  iconData: MyFlutterApp.cancel,
                )),
            SizedBox(height: 17.h),
            DefaultCirculeAvatar(
              onTap: () => AppRouter.router.pushNamedWithReplacementFunction(
                  ParentsHomeScreen.routeName),
              iconData: MyFlutterApp.volumeMedium,
            ),
            SizedBox(height: 10.h),
            DefaultCirculeAvatar(
              onTap: () => AppRouter.router
                  .pushNamedWithReplacementFunction(ExamplesScreen.routeName),
              iconData: MyFlutterApp.music,
            ),
            SizedBox(height: 10.h),
            DefaultCirculeAvatar(
              onTap: () => AppRouter.router.pushNamedWithReplacementFunction(
                  ParentsHomeScreen.routeName),
              iconData: MyFlutterApp.micNone,
            ),
            SizedBox(height: 10.h),
            DefaultCirculeAvatar(
              onTap: () => AppRouter.router
                  .pushNamedWithReplacementFunction(LettersScreen.routeName),
              iconData: MyFlutterApp.arrowRight_2,
            ),
            SizedBox(height: 30.h),
            const LetterCardWidget(
                letter: 'ب', imagePath: 'assets/images/lion.png')
          ],
        ),
      ),
    );
  }
}
