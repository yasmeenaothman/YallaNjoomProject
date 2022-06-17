import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({Key? key}) : super(key: key);
  final String name = 'غزل الحاج';
  final String code = '1000';
  final String coins = '120';
  final bool isParent = true;
  final bool isFemale = false;
  final bool allChildren =
      false; //TODO: must be a list of parents' children not a bool
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
        drawer: drawerWidget(theme),
        appBarIsVisible: true,
        floatingActionButton: SizedBox(
          width: 50.w,
          height: 50.h,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                //TODO: go to addchildinfoscreen
              },
              backgroundColor: theme.primaryColor,
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          heightFactor: 3,
          child: allChildren
              ? Container() //TODO: must add a list of parents' children
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/unhappy_star.png'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'لم يتم إضافة أي طفل',
                      style:
                          theme.textTheme.headline1!.copyWith(fontSize: 20.sp),
                    )
                  ],
                ),
        ));
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
              ListTile(
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
            ],
          ),
        )
      ]),
    );
  }
}
