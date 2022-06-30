import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';

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
              CircleAvatar(
                radius: 50.r,
                child: Image.asset(
                    'assets/images/${isFemale ? 'girl.png' : 'boy.png'}'),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (isParent)
                Text(
                  'محمد الحاج',
                  style:
                      theme.textTheme.headline3!.copyWith(color: Colors.white),
                ),
              if (!isParent)
                Column(
                  children: [
                    Text(
                      'الاسم: $name',
                      style: theme.textTheme.headline3!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'الرمز: $code',
                      style: theme.textTheme.headline3!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الرصيد: $coins',
                          style: theme.textTheme.headline3!
                              .copyWith(color: Colors.white),
                        ),
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
              ListTile(
                horizontalTitleGap: 0,
                leading: Image.asset(
                  'assets/images/home_page.png',
                  width: 20,
                  height: 20,
                  color: theme.primaryColor,
                ),
                title: Text(
                  'الصفحة الرئيسية',
                  style: theme.textTheme.headline3,
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppRouter.router.pushNamedWithReplacementFunction(
                      DoYouHaveAccScreen.routeName);
                },
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: Image.asset(
                    'assets/images/logout.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text('تسجيل الخروج',
                      style: theme.textTheme.headline3!
                          .copyWith(color: Colors.grey[700])),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
