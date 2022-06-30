import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/user_type_screen.dart';

import '../routers/app_router.dart';
import '../widgets/confirm_button_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/scaffold_with_background.dart';
import 'enter_your_code_screen.dart';

class DoYouHaveAccScreen extends StatelessWidget {
  const DoYouHaveAccScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'DoYouHaveAccScreen';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: Column(
        children: [
          SizedBox(
            height: 260.h,
          ),
          CustomDialog(
            text: 'هل لديك حساب؟',
            spaceBeforeWidget: 20.h,
            widget: ConfirmButtonWidget(
              confirmButtonFun: () {
                AppRouter.router.pushNamedWithReplacementFunction(
                    EnterYourCodeScreen.routeName);
              },
              confirmButtonText: 'نعم',
              cancelButtonFun: () {
                AppRouter.router
                    .pushNamedWithReplacementFunction(UserTypeScreen.routeName);
              },
              cancelButtonText: 'لا',
            ),
            imagePath: 'assets/images/glasses_star.png',
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
