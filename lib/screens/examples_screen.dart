import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/widgets/toast_dialog_widget.dart';

import '../helpers/my_methods.dart';
import '../models/solution.dart';
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
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                  child: Image.asset(images[0][1]), //'assets/images/carrot.png'
                  onTap: () {
                    provider.check(1, context, images);
                    print('kkkkkkkkkkkkkkkkkkkkkkkkkkk 1');
                  }),
              Positioned(
                bottom: 78.h,
                left: 175.w,
                child: GestureDetector(
                    child: Image.asset(
                      images[0][2],
                    ),
                    onTap: () {
                      provider.check(2, context, images);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
  /*check(int index,context) async {
    if(images[0][index]==images[1]){
      AppRouter.router.pushNamedWithReplacementFunction(
          BravoScreen.routeName, [false,(){
            AppRouter.router.pushNamedWithReplacementFunction(ExamplesScreen.routeName);
      },
        (){
          AppRouter.router.pushNamedWithReplacementFunction(LetterCardScreen.routeName);
        },
      ]);
      provider.numOfExampleSol==0?await provider.addSolution(Solution(solutionId: '1',userCode: provider.userModel!.code
          ,exampleId: provider.selectedLanguage.exampleId ).toMap())
          :await provider.updateSolution(Solution(solutionId: '1',userCode: provider.userModel!.code
          ,exampleId: provider.selectedLanguage.exampleId));

      print(provider.numOfExampleSol);
    }
    else{
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
    }
  }*/
}
