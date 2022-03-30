import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yalla_njoom/widgets/arithmetic_operation_widget.dart';
import 'package:yalla_njoom/widgets/bravo_dialog.dart';
import 'package:yalla_njoom/widgets/custom_dialog.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import 'package:yalla_njoom/widgets/letter_cart.dart';
import 'package:yalla_njoom/widgets/user_code_dialog.dart';

class MyHomePage extends StatefulWidget {
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
          body: Center(
            child: GestureDetector(
              child: const Icon(
                Icons.ads_click,
                size: 60,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return UserCodeDialog(code: 1000);
                    });
              },
            ),
          ),
        ),
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

  Column bravoBottomWidget(ThemeData theme) => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'هيا ننتقل للحرف التالي',
              style: theme.textTheme.headline1!.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/yellow_arrow.png',
              width: 55.w,
              height: 48.h,
            ),
          )
        ],
      );

  Row confirmButtonsCustomDialogWidget({
    required ThemeData theme,
    required String confirmButtonText,
    required String cancelButtonText,
    required Function() confirmButtonFun,
    required Function() cancelButtonFun,
  }) =>
      Row(
        children: [
          Expanded(
              child: DefaultElevatedButton(
            width: 0,
            height: 44.h,
            radius: 12.r,
            onPressed: confirmButtonFun,
            child: Text(
              confirmButtonText,
              style: theme.textTheme.headline3!.copyWith(color: Colors.white),
            ),
          )),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
              child: DefaultElevatedButton(
            width: 0,
            height: 44.h,
            radius: 12.r,
            child: Text(
              cancelButtonText,
              style: theme.textTheme.headline3!.copyWith(color: Colors.red),
            ),
            onPressed: cancelButtonFun,
            bgColor: theme.colorScheme.secondary,
          )),
        ],
      );

  Card pinCodeCustomDialogWidget(ThemeData theme) => Card(
        margin: EdgeInsets.zero,
        elevation: 0.0,
        color: theme.colorScheme.secondary,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            autoFocus: true,
            pinTheme: PinTheme(
                disabledColor: theme.primaryColor,
                selectedColor: theme.primaryColor,
                errorBorderColor: theme.primaryColor,
                selectedFillColor: theme.primaryColor,
                activeColor: theme.primaryColor,
                inactiveColor: theme.primaryColor,
                activeFillColor: theme.primaryColor,
                inactiveFillColor: theme.primaryColor),
            onChanged: (e) {},
            appContext: context,
            length: 4,
            cursorColor: theme.primaryColor,
            textStyle: TextStyle(color: theme.primaryColor),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      );
}
  /**CustomDialog(
                        text: 'هل لديك حساب؟',
                        spaceBeforeWidget: 20.h,
                        widget: confirmButtonsCustomDialogWidget(
                          theme: theme,
                          confirmButtonFun: () {},
                          confirmButtonText: 'نعم',
                          cancelButtonFun: () {},
                          cancelButtonText: 'لا',
                        ),
                        imagePath: 'assets/images/glasses_star.png',
                        crossAxisAlignment: CrossAxisAlignment.start,
                      );*/

  /**
  * CustomDialog(
                        text: 'أدخل الرمز الخاص بك',
                        spaceBeforeWidget: 10.h,
                        widget: pinCodeCustomDialogWidget(theme),
                        imagePath: 'assets/images/smiling_star.png',
                        crossAxisAlignment: CrossAxisAlignment.start,
                      );
  */

  /**
   * CustomDialog(
                        text: 'الرمز خاطئ',
                        spaceBeforeWidget: 20.h,
                        widget: confirmButtonsCustomDialogWidget(
                          theme: theme,
                          confirmButtonFun: () {},
                          confirmButtonText: 'حاول مرة أخرى',
                          cancelButtonFun: () {},
                          cancelButtonText: 'إلغاء',
                        ),
                        imagePath: 'assets/images/crying_star.png',
                        crossAxisAlignment: CrossAxisAlignment.center,
                      );
   */

  /**
   *  CustomDialog(
                        text: 'الإجابة خاطئة',
                        spaceBeforeWidget: 20.h,
                        widget: confirmButtonsCustomDialogWidget(
                          theme: theme,
                          confirmButtonFun: () {},
                          confirmButtonText: 'حاول مرة أخرى',
                          cancelButtonFun: () {},
                          cancelButtonText: 'إلغاء',
                        ),
                        imagePath: 'assets/images/crying_star.png',
                        crossAxisAlignment: CrossAxisAlignment.center,
                      );
   */

// showDialog(
//                   context: context,
//                   builder: (ctx) {
//                     return ArthOperationWidget(
//                       firstNum: 9.toString(),
//                       secondNum: 9.toString(),
//                     );
//                   }),
//               child: const Icon(
//                 Icons.ads_click,
//                 size: 60,
//               )

// BravoDialog(
//             imagePath: 'assets/images/lion.png',
//             text: 'النطق صحيح',
//             height: 258,
//             widget: bravoBottomWidget(theme),
//           ),

// BravoDialog(
//             imagePath: 'assets/images/lion.png',
//             text: 'الإجابة صحيحة',
//             height: 149,
//           ),

// const LetterCard(
//             letter: 'أ',
//             imagePath: 'assets/images/lion.png',
//           )