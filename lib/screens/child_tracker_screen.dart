import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/voice_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

import '../widgets/scaffold_with_background.dart';

class ChildTrackerScreen extends StatelessWidget {
  const ChildTrackerScreen({Key? key}) : super(key: key);
  static const String routeName = 'ChildTrackerScreen';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 260.h,
            ),
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    left: -20.w,
                    bottom: -5.h,
                    child: Image.asset(
                      'assets/images/star_star.png',
                      fit: BoxFit.cover,
                      height: 195.6.h,
                      width: 198.4.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: _buildMyDefaultButton(theme,
                        color: theme.primaryColor,
                        text: 'متابعة قراءات الحروف', onPressed: () {
                      AppRouter.router.pushNamedWithReplacementFunction(
                          VoiceScreen.routeName, [true]);
                    }),
                  ),
                ]),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: _buildMyDefaultButton(theme,
                  color: const Color(0xFFFFA4AC),
                  text: 'متابعة قراءات الأرقام', onPressed: () {
                AppRouter.router.pushNamedWithReplacementFunction(
                    VoiceScreen.routeName, [false]);
              }),
            )
          ],
        ),
      ),
    );
  }

  DefaultElevatedButton _buildMyDefaultButton(
    ThemeData theme, {
    required Color color,
    required String text,
    required Function() onPressed,
  }) {
    return DefaultElevatedButton(
      size: Size(double.infinity, 65.h),
      bgColor: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(children: [
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.transparent,
          ),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.headline3!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ]),
      ),
      top: 0,
      onPressed: onPressed,
    );
  }
}
