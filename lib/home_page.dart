import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yalla_njoom/models/my_flutter_app.dart';
import 'package:yalla_njoom/widgets/letter_cart_widget.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String name = 'غزل الحاج';
  final String code = '1000';
  final String coins = '120';
  final bool isParent = true;
  final bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            drawer: drawerWidget(theme),
            appBar: AppBar(),
            body: const LetterCardWidget(
                letter: 'أ', imagePath: 'assets/images/lion.png')),
      ),
    );
  }

  Drawer drawerWidget(ThemeData theme) {
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
                leading: Icon(
                  MyFlutterApp.home,
                  color: theme.primaryColor,
                ),
                title: Text(
                  'الصفحة الرئيسية',
                  style: theme.textTheme.headline3,
                ),
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(MyFlutterApp.logout),
                title: Text('تسجيل الخروج',
                    style: theme.textTheme.headline3!
                        .copyWith(color: Colors.grey[700])),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
