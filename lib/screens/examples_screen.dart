import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';

import '../helpers/my_methods.dart';
import '../providers/firestore_provider.dart';
import '../widgets/container_with_image.dart';
import '../widgets/container_with_text.dart';
import '../widgets/default_circular_avatar.dart';

class ExamplesScreen extends StatelessWidget {
  static String routeName = 'ExamplesScreen';
  List images = [];
  late FirestoreProvider provider;
  ExamplesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    images = generateImageList(provider: provider, isLetter: true);
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
            child: Image.asset(images[0][0]), //'assets/images/happy.png'
            onTap: () {
              provider.check(0, context, images);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                    child:
                        Image.asset(images[0][1]), //'assets/images/carrot.png'
                    onTap: () {
                      provider.check(1, context, images);
                      print('kkkkkkkkkkkkkkkkkkkkkkkkkkk 1');
                    }),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    provider.check(2, context, images);
                  },
                  child: Image.asset(
                    images[0][2],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
