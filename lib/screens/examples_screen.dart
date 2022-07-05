import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';

import '../widgets/container_with_image.dart';
import '../widgets/container_with_text.dart';
import '../widgets/default_circular_avatar.dart';

class ExamplesScreen extends StatelessWidget {
  static String routeName = 'ExamplesScreen';

  const ExamplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithImage(
        imageName: 'assets/images/background_examples.png',
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 20.h, 0, 0),
            child: DefaultCirculeAvatar(
              onTap: () {
                AppRouter.router
                    .pushNamedWithReplacementFunction(LettersScreen.routeName);
              },
            ),
          ),
          SizedBox(
            height: 230.h,
          ),
          const ContainerWithText(),
          Image.asset('assets/images/happy.png'),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/images/carrot.png'),
              Positioned(
                bottom: 78.h,
                left: 175.w,
                child: Image.asset(
                  'assets/images/impressed.png',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
