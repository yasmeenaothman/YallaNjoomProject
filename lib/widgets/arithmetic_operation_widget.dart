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
              bottom: 95.h,
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
                                firstNum,
                                style: numberTextStyle(theme),
                              ),
                              theme: theme),
                          Text(
                            'x',
                            style: operatorTextStyle(theme, 25.sp),
                          ),
                          circleWidget(
                              child: Text(
                                secondNum,
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
}
