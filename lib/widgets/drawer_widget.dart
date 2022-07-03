import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';

import '../models/my_flutter_app.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  final String name = 'غزل الحاج';
  final String code = '1000';
  final String coins = '120';
  final bool isParent = true;
  final bool isFemale = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.secondary,
      child: Column(children: [
        Container(
          color: theme.primaryColor,
          child: Center(
            child: Column(children: [
              _buildCircleAvatar(),
              SizedBox(
                height: 20.h,
              ),
              if (isParent) _buildDrawerTextWidget(theme, text: 'محمد الحاج'),
              if (!isParent)
                Column(
                  children: [
                    _buildDrawerTextWidget(theme, text: 'الاسم: $name'),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildDrawerTextWidget(theme, text: 'الرمز: $code'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDrawerTextWidget(theme, text: 'الرصيد: $coins'),
                        SizedBox(width: 10.w),
                        Image.asset('assets/images/coin.png'),
                      ],
                    ),
                  ],
                )
            ]),
          ),
          padding: EdgeInsets.symmetric(vertical: 50.h),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListTile(theme,
                  icon: MyFlutterApp.home, text: 'الصفحة الرئيسية'),
              GestureDetector(
                onTap: () {
                  AppRouter.router.pushNamedWithReplacementFunction(
                      DoYouHaveAccScreen.routeName);
                },
                child: _buildListTile(theme,
                    icon: MyFlutterApp.logout, text: 'تسجيل الخروج'),
              ),
            ],
          ),
        )
      ]),
    );
  }

  ListTile _buildListTile(
    ThemeData theme, {
    required icon,
    required text,
  }) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: theme.primaryColor,
      ),
      title: Text(
        text,
        style: theme.textTheme.headline3,
      ),
    );
  }

  Text _buildDrawerTextWidget(ThemeData theme, {required text}) {
    return Text(
      text,
      style: theme.textTheme.headline3!.copyWith(color: Colors.white),
    );
  }

  CircleAvatar _buildCircleAvatar() {
    return CircleAvatar(
      radius: 50.r,
      child: Image.asset('assets/images/${isFemale ? 'girl.png' : 'boy.png'}'),
    );
  }
}
