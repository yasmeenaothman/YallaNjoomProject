import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/bravo_dialog.dart';
import 'package:yalla_njoom/widgets/default_circular_avatar.dart';

import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';

class BravoScreen extends StatelessWidget {
  static const String routeName = 'BravoScreen';

  const BravoScreen({Key? key, required this.isPronunciationWidget})
      : super(key: key);
  final bool isPronunciationWidget;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bravo_background.png'),
              fit: BoxFit.fitHeight)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: DefaultCirculeAvatar(
                    onTap: () => AppRouter.router
                        .pushNamedWithReplacementFunction(
                            ParentsHomeScreen.routeName),
                    iconData: MyFlutterApp.cancel,
                  )),
              Expanded(
                child: BravoDialog(
                  imagePath: 'assets/images/lion.png',
                  widget:
                      isPronunciationWidget ? bravoBottomWidget(theme) : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column bravoBottomWidget(ThemeData theme) => Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'هيا ننتقل للحرف التالي',
              style: theme.textTheme.headline1!.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {
              //TODO: go to the next letter
            },
            child: Image.asset(
              'assets/images/yellow_arrow.png',
              width: 55.w,
              height: 48.h,
            ),
          )
        ],
      );
}
