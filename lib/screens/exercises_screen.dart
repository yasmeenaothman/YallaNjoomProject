import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import '../models/example.dart';
import '../models/my_flutter_app.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_circular_avatar.dart';

class ExercisesScreen extends StatelessWidget {
  int exampleType = Random().nextInt(2) + 1;
  static String routeName = 'ExcercisesScreen';
  bool isSum;
  List<Example> examples;

  /// these list from provider (pre exist from firebase)
  ExercisesScreen({
    Key? key,
    this.isSum = true,
    required this.examples,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image1 = checkExampleType(exampleType);
    String image2 = checkExampleType(exampleType);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ContainerWithImage(
        imageName: 'assets/images/back_with_num.png',
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 20.h, 0, 0),
            child: DefaultCirculeAvatar(
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          /// شوفي قصة الشمال واليمين للأيقونات حاليا التزمت بالتصميم بس بده تعديل
          Directionality(
            textDirection: TextDirection.ltr,
            child: DefaultCirculeAvatar(
              onTap: () {},
              iconData: Icons.arrow_back_ios_sharp,
            ),
          ),
          SizedBox(
            height: 90.h,
          ),
          Row(
            children: [
              /// note حاليا asset ولكن بالاساس بنحصل عليها من الفيربيس عشان كده netwok; خليها
              Expanded(child: Image.asset(image1)),
              SizedBox(
                width: 11.w,
              ),

              /// n هذا اللون خذيه من الثيم لانه متكرر
              Icon(
                isSum ? MyFlutterApp.plus : Icons.minimize_outlined,
                size: 24.r,
                color: const Color((0xFF074785)),
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(child: Image.asset(image2)),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 48.w),
            height: 49.h,
            child: Padding(
              padding: EdgeInsets.all(40.0.w),
              child: Row(
                children: [],
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

  String checkExampleType(int exampleType) {
    String result = '';
    switch (exampleType) {
      case 1:
        result = examples[Random().nextInt(examples.length)].example1;
        break;
      case 2:
        result = examples[Random().nextInt(examples.length)].example2;
        break;
      default:
        result = examples[Random().nextInt(examples.length)].example3;
    }
    return result;
  }
}
