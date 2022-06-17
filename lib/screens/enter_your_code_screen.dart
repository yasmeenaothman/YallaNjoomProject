import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import 'package:yalla_njoom/widgets/pin_code_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../widgets/arithmetic_operation_widget.dart';
import '../widgets/custom_dialog.dart';

class EnterYourCodeScreen extends StatefulWidget {
  const EnterYourCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterYourCodeScreen> createState() => _EnterYourCodeScreenState();
}

class _EnterYourCodeScreenState extends State<EnterYourCodeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
        body: Column(
      children: [
        SizedBox(
          height: 160.h,
        ),
        CustomDialog(
          text: 'أدخل الرمز الخاص بك',
          spaceBeforeWidget: 10.h,
          widget: PinCodeWidget(
            onChanged: (value) {
              print(value);
            },
          ),
          imagePath: 'assets/images/smiling_star.png',
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        SizedBox(
          height: 144.h,
        ),
        DefaultElevatedButton(
          width: 129.w,
          height: 44.h,
          radius: 12.r,
          onPressed: () {
            //TODO: Go to ParentsHomePage or ChildHomePage
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const DefaultCirculeAvatar(
                          padding: 15,
                          imagePath: 'assets/images/close.png',
                        ),
                        Expanded(
                          child: ArthOperationWidget(
                            firstNum: 9.toString(),
                            secondNum: 9.toString(),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Text(
            'دخول',
            style: theme.textTheme.headline3!.copyWith(color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
