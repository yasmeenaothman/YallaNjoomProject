import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/child_info_dialog.dart';
import 'package:yalla_njoom/widgets/confirm_button_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../widgets/custom_dialog.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_elevated_button.dart';

class AddChildInfoScreen extends StatelessWidget {
  const AddChildInfoScreen({Key? key}) : super(key: key);

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
            const DefaultCirculeAvatar(
              padding: 15,
              imagePath: 'assets/images/close.png',
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
              child: DefaultElevatedButton(
                width: 129.w,
                height: 44.h,
                radius: 12.r,
                onPressed: () {
                  //TODO: add the child to allChildren list or show the dialog
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 160.h,
                            ),
                            CustomDialog(
                              text: 'الرمز خاطئ',
                              spaceBeforeWidget: 20.h,
                              widget: ConfirmButtonWidget(
                                confirmButtonFun: () {},
                                confirmButtonText: 'حاول مرة أخرى',
                                cancelButtonFun: () {},
                                cancelButtonText: 'إلغاء',
                              ),
                              imagePath: 'assets/images/crying_star.png',
                              crossAxisAlignment: CrossAxisAlignment.center,
                            )
                          ],
                        );
                      });
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
