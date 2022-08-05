import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'default_elevated_button.dart';

class ArthOperationWidget extends StatefulWidget {
  final Function onPressed;
  const ArthOperationWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<ArthOperationWidget> createState() => _ArthOperationWidgetState();
}

class _ArthOperationWidgetState extends State<ArthOperationWidget> {
  bool answerTrue = true;
  int? firstNum;
  int? secondNum;
  num? machineAnswer;
  String? userAnswer;
  @override
  void initState() {
    firstNum = getRandomNumber(11);
    secondNum = getRandomNumber(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 175.h,
              child: Image.asset('assets/images/smart_star.png'),
            ),
            Container(
              width: 325.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'لتأكيد هويتك أجب معنا السؤال التالي:',
                      style: theme.textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          circleWidget(
                              child: Text(
                                firstNum.toString(),
                                style: numberTextStyle(theme),
                              ),
                              theme: theme),
                          Text(
                            'x',
                            style: operatorTextStyle(theme, 25.sp),
                          ),
                          circleWidget(
                              child: Text(
                                secondNum.toString(),
                                style: numberTextStyle(theme),
                              ),
                              theme: theme),
                          Text(
                            '=',
                            style: operatorTextStyle(theme, 35.sp),
                          ),
                          circleWidget(
                              child: Card(
                                color: theme.colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.r)),
                                margin: EdgeInsets.zero,
                                shadowColor: const Color(0x28000000),
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      userAnswer = value;
                                    },
                                    maxLength: 2,
                                    cursorColor: theme.primaryColor,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 2.h),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    style: numberTextStyle(theme),
                                  ),
                                ),
                              ),
                              theme: theme)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  DefaultElevatedButton(
                    size: Size(129.w, 44.h),
                    top: 0,
                    radius: 12.r,
                    onPressed: () {
                      machineAnswer = firstNum! * secondNum!;
                      if (userAnswer != null) {
                        if (userAnswer!.isNotEmpty) {
                          if (userAnswer == machineAnswer.toString()) {
                            widget.onPressed(true);
                          } else {
                            widget.onPressed(false);
                          }
                        }
                      }
                    },
                    child: Text(
                      'تأكيد',
                      style: theme.textTheme.headline3!
                          .copyWith(color: Colors.white),
                    ),
                  )
                  // Image.asset('assets/images/yellow_circle.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle operatorTextStyle(ThemeData theme, double fontSize) {
    return TextStyle(
        fontFamily: 'Tajawal',
        color: theme.primaryColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500);
  }

  TextStyle numberTextStyle(ThemeData theme) {
    return TextStyle(
        height: 1.8.h,
        fontFamily: 'Tajawal',
        color: theme.primaryColor,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500);
  }

  Widget circleWidget({required Widget child, required ThemeData theme}) =>
      Container(
        width: 61.w,
        height: 56.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: theme.colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                color: const Color(0x28000000),
                offset: Offset(3.h, 6.w),
                blurRadius: 9.r,
              )
            ]),
        child: Center(child: child),
      );

  getRandomNumber(range) {
    return Random().nextInt(range);
  }
}
