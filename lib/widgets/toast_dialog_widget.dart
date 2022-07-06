import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import '../routers/app_router.dart';
import '../screens/child_home_screen.dart';

class ToastDialogWidget extends StatelessWidget {
  const ToastDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 325.w,
              height: 88.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'حاول مرة أخرى ',
                    style: theme.textTheme.headline1,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: -13.h,
                left: -30.w,
                child: Image.asset(
                  'assets/images/lion_with_lamp.png',
                  width: 135.w,
                  height: 132.h,
                )),
          ],
        ),
      ),
    );
  }
}
