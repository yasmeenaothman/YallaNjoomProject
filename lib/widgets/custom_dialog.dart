import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatefulWidget {
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
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              bottom: 85.h,
              child: RotationTransition(
                turns:
                    Tween<double>(begin: -0.05, end: 0.05).animate(animation),
                child: Image.asset(
                  widget.imagePath,
                  height: 185.6.h,
                  width: 188.4.w,
                ),
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
                crossAxisAlignment: widget.crossAxisAlignment,
                children: [
                  Text(
                    widget.text,
                    style: theme.textTheme.headline1,
                  ),
                  SizedBox(height: widget.spaceBeforeWidget),
                  widget.widget
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
