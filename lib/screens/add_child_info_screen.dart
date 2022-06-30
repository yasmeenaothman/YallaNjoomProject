import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/models/my_flutter_app.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/child_info_dialog.dart';
import 'package:yalla_njoom/widgets/confirm_button_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../widgets/custom_dialog.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_button.dart';

class AddChildInfoScreen extends StatelessWidget {
  static const String routeName = 'AddChildInfoScreen';

  const AddChildInfoScreen({Key? key}) : super(key: key);
  final bool codeTrue = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            DefaultCirculeAvatar(
              onTap: () => AppRouter.router.pushNamedWithReplacementFunction(
                  ParentsHomeScreen.routeName),
              iconData: MyFlutterApp.cancel,
            ),
            SizedBox(
              height: 200.h,
            ),
            const ChildInfoDialog(),
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: Alignment.center,
              child: DefaultButton(
                width: 129.w,
                height: 44.h,
                radius: 12.r,
                onPressed: () {
                  //TODO: if the code was false show customDialog

                  if (codeTrue) {
                    //TODO: add to allChildren List
                    AppRouter.router.pushNamedWithReplacementFunction(
                        ParentsHomeScreen.routeName);
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 260.h,
                              ),
                              CustomDialog(
                                text: 'الرمز خاطئ',
                                spaceBeforeWidget: 20.h,
                                widget: ConfirmButtonWidget(
                                  confirmButtonFun: () {
                                    AppRouter.router.pop();
                                  },
                                  confirmButtonText: 'حاول مرة أخرى',
                                  cancelButtonFun: () {
                                    AppRouter.router
                                        .pushNamedWithReplacementFunction(
                                            ParentsHomeScreen.routeName);
                                  },
                                  cancelButtonText: 'إلغاء',
                                ),
                                imagePath: 'assets/images/crying_star.png',
                                crossAxisAlignment: CrossAxisAlignment.center,
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text(
                  'تسجيل',
                  style:
                      theme.textTheme.headline3!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
