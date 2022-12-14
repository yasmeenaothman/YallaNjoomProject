import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/voice_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

import '../models/my_flutter_app.dart';
import '../widgets/default_circular_avatar.dart';
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
            Padding(
              padding:  EdgeInsets.only(right: 20.w,top: 25.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: DefaultCirculeAvatar(
                  onTap: () => AppRouter.router
                      .pop(),
                  iconData: MyFlutterApp.cancel,
                ),
              ),
            ),
            SizedBox(
              height: 200.h,
            ),
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    left: -20.w,
                    bottom: -5.h,
                    child: PhloxAnimations(
                       duration: const Duration(seconds: 1),
                      fromY: 30,
                      child: Image.asset(
                        'assets/images/star_star.png',
                        fit: BoxFit.cover,
                        height: 195.6.h,
                        width: 198.4.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: _buildMyDefaultButton(theme,
                        color: theme.primaryColor,
                        text: '???????????? ???????????? ????????????', onPressed: () {
                      AppRouter.router.pushNamedFunction(
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
                  text: '???????????? ???????????? ??????????????', onPressed: () {
                AppRouter.router.pushNamedFunction(
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
