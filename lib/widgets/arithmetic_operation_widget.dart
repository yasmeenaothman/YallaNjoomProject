import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArthOperationWidget extends StatelessWidget {
  final String firstNum;
  final String secondNum;
  const ArthOperationWidget(
      {Key? key, required this.firstNum, required this.secondNum})
      : super(key: key);

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
                bottom: 115.h,
                child: Image.asset('assets/images/smart_star.png')),
            Container(
              padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
              width: 325.w,
              height: 190.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'لتأكيد هويتك أجب معنا السؤال التالي',
                      style: theme.textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circleWidget(num: firstNum, theme: theme),
                        Text(
                          'x',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        circleWidget(num: secondNum, theme: theme),
                        Text(
                          '=',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x28000000),
                                offset: Offset(3.h, 6.w),
                                blurRadius: 9.r,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Card(
                            color: theme.colorScheme.secondary,
                            shape: const CircleBorder(),
                            margin: EdgeInsets.zero,
                            shadowColor: const Color(0x28000000),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Center(
                                child: TextField(
                                  cursorColor: theme.primaryColor,
                                  maxLength: 2,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image.asset('assets/images/yellow_circle.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleWidget({required String num, required ThemeData theme}) =>
      Container(
        width: 70.w,
        height: 70.h,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                color: const Color(0x28000000),
                offset: Offset(3.h, 6.w),
                blurRadius: 9.r,
              )
            ]),
        child: Center(
          child: Text(
            num,
            style: TextStyle(
                color: theme.primaryColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      );
}
