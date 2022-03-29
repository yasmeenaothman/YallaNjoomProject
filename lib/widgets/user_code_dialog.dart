import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCodeDialog extends StatelessWidget {
  final int code;
  const UserCodeDialog({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 325.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0.w,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'انتبه',
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: Colors.red,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'الكود الخاص بك',
                      style: theme.textTheme.headline2,
                    ),
                    Text(
                      code.toString(),
                      style: theme.textTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.w),
                      child: SizedBox(
                        width: 178.w,
                        child: Text(
                          'احتفظ بالكود لتستطيع الدخول به مرة أخرى',
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          'التالي',
                          style: theme.textTheme.headline3!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 40.h,
                left: -10.w,
                child: Image.asset('assets/images/code_dialog.png')),
          ],
        ),
      ),
    );
  }
}
