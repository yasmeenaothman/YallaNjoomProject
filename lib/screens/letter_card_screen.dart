import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/examples_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/music_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
import 'package:yalla_njoom/widgets/letter_cart_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/my_flutter_app.dart';
import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';

class LetterCardScreen extends StatefulWidget {
  const LetterCardScreen({Key? key}) : super(key: key);
  static const String routeName = 'LetterCardScreen';

  @override
  State<LetterCardScreen> createState() => _LetterCardScreenState();
}

class _LetterCardScreenState extends State<LetterCardScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) => ScaffoldWithBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      onTap: () async {
                        await provider.playAudio(isSound: true);
                      } /*=> AppRouter.router.pushNamedWithReplacementFunction(
                      ParentsHomeScreen.routeName)*/
                      ,
                      iconData: MyFlutterApp.volumeMedium,
                    ),
                    SizedBox(height: 10.h),
                    DefaultCirculeAvatar(
                      onTap: () async {
                        AppRouter.router.pushNamedWithReplacementFunction(
                            MusicScreen.routeName);
                        await provider.playAudio(isSound: false);
                      },
                      iconData: MyFlutterApp.music,
                    ),
                    SizedBox(height: 10.h),
                    DefaultCirculeAvatar(
                      onTap: () => AppRouter.router
                          .pushNamedWithReplacementFunction(
                              BravoScreen.routeName, true),
                      iconData: MyFlutterApp.micNone,
                    ),
                    SizedBox(height: 10.h),
                    DefaultCirculeAvatar(
                      onTap: () =>
                          AppRouter.router.pushNamedWithReplacementFunction(
                        BravoScreen.routeName,
                        [false, () {}],
                      ),
                      iconData: MyFlutterApp.arrowRight_2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
                        .animate(animation),
                child: LetterCardWidget(
                    //TODO: use imagePath from examples of this letter
                    letter: provider.selectedLanguage.shape!,
                    imagePath: 'assets/images/lion.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
