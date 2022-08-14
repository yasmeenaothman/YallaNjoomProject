/*

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';

import '../helpers/my_methods.dart';
import '../models/example.dart';
import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/toast_dialog_widget.dart';
import 'bravo_screen.dart';
import 'operation_screen.dart';

class ExercisesScreen extends StatelessWidget {
  static String routeName = 'ExcercisesScreen';
  final bool isSum;
  final bool isMix;
  late int result;
  late List<int> choices;
  ExercisesScreen({
    Key? key,
    required this.isSum,
    required this.isMix,
  }) : super(key: key);
  late FirestoreProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    Example example1 =
        selectRandomlyNumExample(provider: provider); //provider: provider
    Example example2 = selectRandomlyNumExample(provider: provider);
    String signType = returnOperation();
    result = isMix
        ? calTwoNum(signType == '+', example1.exampleId!, example2.exampleId!)
        : calTwoNum(isSum, example1.exampleId!, example2.exampleId!);
    choices = generateListOfAnswer(result.abs());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ContainerWithImage(
        imageName: 'assets/images/back_with_num.png',
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 20.h, 0, 0),
            child: DefaultCirculeAvatar(
              onTap: () {
                AppRouter.router.pop();
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          /// شوفي قصة الشمال واليمين للأيقونات حاليا التزمت بالتصميم بس بده تعديل
          */
/*Directionality(
            textDirection: TextDirection.ltr,
            child: DefaultCirculeAvatar(
              onTap: () {},
              iconData: Icons.arrow_back_ios_sharp,
            ),
          ),*//*

          SizedBox(
            height: 120.h,
          ),
          Row(
            children: [
              /// note حاليا asset ولكن بالاساس بنحصل عليها من الفيربيس عشان كده netwok; خليها
              Expanded(
                  child: Image.asset(selectRandomlyExampleImage(
                      result.isNegative ? example2 : example1))),
              SizedBox(
                width: 11.w,
              ),

              Icon(
                isMix
                    ? signType == '+'
                        ? MyFlutterApp.plus
                        : Icons.minimize_outlined
                    : isSum
                        ? MyFlutterApp.plus
                        : Icons.minimize_outlined,
                size: 24.r,
                color: const Color((0xFF074785)),
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                  child: Image.asset(selectRandomlyExampleImage(
                      result.isNegative ? example1 : example2))),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 48.w),
            height: 49.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 3.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        check(0, context);
                      },
                      child: Text(
                        ArabicNumbers().convert('${choices[0]}'),
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 24.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        check(1, context);
                      },
                      child: Text(
                        ArabicNumbers().convert('${choices[1]}'),
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 24.sp,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        check(2, context);
                      },
                      child: Text(
                        ArabicNumbers().convert('${choices[2]}'),
                        style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 24.sp,
                            color: Colors.teal,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: const Color(0xFFADCDED),
                border:
                    Border.all(color: const Color((0xFF074785)), width: 3.r),
                borderRadius: BorderRadius.circular(30.r)),
          )
        ],
      ),
    );
  }

  check(int index, context) async {
    if (choices[index] == result.abs()) {
      provider.updateKidCoins(2);
      print('coinnnnnnns${(provider.userModel as ChildModel).coins}');
      AppRouter.router.pushNamedWithReplacementFunction(BravoScreen.routeName, [
        false,
        false,
        () {
          AppRouter.router.pushNamedWithReplacementFunction(
              ExercisesScreen.routeName, [isSum, isMix]);
        },
        () {
          AppRouter.router.pop();
        }
      ]);
    } else {
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
  }
}
*/

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';

import '../helpers/my_methods.dart';
import '../models/example.dart';
import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/toast_dialog_widget.dart';
import 'bravo_screen.dart';

class ExercisesScreen extends StatefulWidget {
  ExercisesScreen({
    Key? key,
    required this.isSum,
    required this.isMix,
  }) : super(key: key);
  static String routeName = 'ExcercisesScreen';
  final bool isSum;
  final bool isMix;

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late FirestoreProvider provider;

  late int result;

  late List<int> choices;
  @override
  void initState() {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    //provider.audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Example example1 =
    selectRandomlyNumExample(provider: provider); //provider: provider
    Example example2 = selectRandomlyNumExample(provider: provider);
    String signType = returnOperation();
    result = widget.isMix
        ? calTwoNum(signType == '+', example1.exampleId!, example2.exampleId!)
        : calTwoNum(widget.isSum, example1.exampleId!, example2.exampleId!);
    choices = generateListOfAnswer(result.abs());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ContainerWithImage(
          imageName: 'assets/images/back_with_num.png',
          children: [
      Padding(
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 0, 0),
      child: DefaultCirculeAvatar(
        onTap: () {
          AppRouter.router.pop();
        },
      ),
    ),
    SizedBox(
    height: 20.h,
    ),

    /// شوفي قصة الشمال واليمين للأيقونات حاليا التزمت بالتصميم بس بده تعديل
    /*Directionality(
            textDirection: TextDirection.ltr,
            child: DefaultCirculeAvatar(
              onTap: () {},
              iconData: Icons.arrow_back_ios_sharp,
            ),
          ),*/
    SizedBox(
    height: 120.h,
    ),
    Row(
    children: [
    /// note حاليا asset ولكن بالاساس بنحصل عليها من الفيربيس عشان كده netwok; خليها
    Expanded(
    child: Image.asset(selectRandomlyExampleImage(
    result.isNegative ? example2 : example1))),
    SizedBox(
    width: 11.w,
    ),
      Icon(
        widget.isMix
            ? signType == '+'
            ? MyFlutterApp.plus
            : Icons.minimize_outlined
            : widget.isSum
            ? MyFlutterApp.plus
            : Icons.minimize_outlined,
        size: 24.r,
        color: const Color((0xFF074785)),
      ),
      SizedBox(
        width: 11.w,
      ),
      Expanded(
          child: Image.asset(selectRandomlyExampleImage(
              result.isNegative ? example1 : example2))),
    ],
    ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 48.w),
              height: 49.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 3.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          check(0, context);
                        },
                        child: Text(
                          ArabicNumbers().convert('${choices[0]}'),
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 24.sp,
                              color: Colors.orange,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          check(1, context);
                        },
                        child: Text(
                          ArabicNumbers().convert('${choices[1]}'),
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 24.sp,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          check(2, context);
                        },
                        child: Text(
                          ArabicNumbers().convert('${choices[2]}'),
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 24.sp,
                              color: Colors.teal,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color(0xFFADCDED),
                  border:
                  Border.all(color: const Color((0xFF074785)), width: 3.r),
                  borderRadius: BorderRadius.circular(30.r)),
            )
          ],
      ),
    );
  }

  check(int index, context) async {
    if (choices[index] == result.abs()) {
      provider.updateKidCoins(2);
      print('coinnnnnnns${(provider.userModel as ChildModel).coins}');
      AppRouter.router.pushNamedWithReplacementFunction(BravoScreen.routeName, [
        false,
        false,
            () {
          AppRouter.router.pushNamedWithReplacementFunction(
              ExercisesScreen.routeName, [widget.isSum, widget.isMix]);
        },
            () {
          AppRouter.router.pop();
        }
      ]);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black,
          builder: (ctx) {
            provider.playEncourageAudio('assets/audio/حاول مرة أخرى .mp3');
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
  }
}
