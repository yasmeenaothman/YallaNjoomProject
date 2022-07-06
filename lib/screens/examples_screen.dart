import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/widgets/toast_dialog_widget.dart';

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
                AppRouter.router.pushNamedWithReplacementFunction(
                    LetterCardScreen.routeName);
              },
            ),
          ),
          SizedBox(
            height: 230.h,
          ),
          const ContainerWithText(),
          GestureDetector(
            child: Image.asset('assets/images/happy.png'),
            onTap: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                  child: Image.asset('assets/images/carrot.png'),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: Colors.black,
                        builder: (ctx) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 260.h,
                              ),
                              const ToastDialogWidget()
                            ],
                          );
                        });
                  }),
              Positioned(
                bottom: 78.h,
                left: 175.w,
                child: GestureDetector(
                    child: Image.asset(
                      'assets/images/impressed.png',
                    ),
                    onTap: () {
                      AppRouter.router.pushNamedWithReplacementFunction(
                          BravoScreen.routeName, false);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
