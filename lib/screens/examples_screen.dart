import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';

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
    provider.allSolutions
                .firstWhere((element) =>
                    element.exampleId == provider.selectedLanguage.exampleId)
                .numOfSolutions ==
            0
        ? provider.playEncourageAudio('assets/audio/نضغط ع حرف .mp3')
        : provider.audioPlayer.dispose();
    return Scaffold(
      body: ContainerWithImage(
        imageName: 'assets/images/background_examples.png',
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 20.h, 0, 0),
            child: DefaultCirculeAvatar(
              onTap: () {
                provider.audioPlayer.dispose();
                AppRouter.router.pop();
              },
            ),
          ),
          SizedBox(
            height: 230.h,
          ),
          const ContainerWithText(),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            child: Image.asset(
              images[0][0],
              height: 120.h,
              width: 120.h,
            ),
            //'assets/images/happy.png'
            onTap: () {
              provider.check(0, context, images);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        images[0][1],
                        height: 120.h,
                        width: 120.h,
                      ),
                    ), //'assets/images/carrot.png'
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
                    height: 120.h,
                    width: 120.h,
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
