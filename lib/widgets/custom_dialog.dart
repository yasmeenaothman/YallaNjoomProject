import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final String text;
  final String imagePath;
  final Widget widget;
  final CrossAxisAlignment crossAxisAlignment;
  final double spaceBeforeWidget;
  const CustomDialog(
      {Key? key,
      required this.text,
      required this.widget,
      required this.imagePath,
      required this.crossAxisAlignment,
      required this.spaceBeforeWidget})
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
              bottom: 85.h,
              child: Image.asset(
                imagePath,
                height: 185.6.h,
                width: 188.4.w,
              ),
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
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Text(
                    text,
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(height: spaceBeforeWidget),
                  widget
                ],
              ),
            ),

            // Image.asset(
            //   imagePath,
            //   height: 185.6.h,
            //   width: 188.4.w,
            // ),
            // Positioned(
            //   top: 117.h,
            //   child: Container(
            //     width: 325.w,
            //     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            //     decoration: BoxDecoration(
            //       color: theme.colorScheme.secondary,
            //       borderRadius: BorderRadius.circular(20.r),
            //       border: Border.all(
            //         color: theme.primaryColor,
            //         width: 3.0,
            //       ),
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: crossAxisAlignment,
            //       children: [
            //         Text(
            //           text,
            //           style: theme.textTheme.headline1,
            //         ),
            //         SizedBox(height: spaceBeforeWidget),
            //         widget
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
