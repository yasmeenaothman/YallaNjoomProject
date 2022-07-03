// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/images/background.png'),
//             fit: BoxFit.cover,
//             colorFilter:
//                 ColorFilter.mode(Color(0x57FFFFFF), BlendMode.srcATop)),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/widgets/arithmetic_operation_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import 'package:yalla_njoom/widgets/user_code_dialog.dart';

import '../models/my_flutter_app.dart';
import '../widgets/default_circular_avatar.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);
  static const String routeName = 'UserTypeScreen';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userWidget(
                context: context,
                imageName: 'child_user.png',
                bgColor: Theme.of(context).colorScheme.secondary,
                text: 'طفل',
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 260.h,
                            ),
                            const UserCodeDialog(code: 1000, isParent: false)
                          ],
                        );
                      });
                }),
            SizedBox(
              height: 50.h,
            ),
            userWidget(
              context: context,
              imageName: 'parent_user.png',
              bgColor: Colors.white,
              text: 'ولي أمر',
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: DefaultCirculeAvatar(
                                onTap: () => AppRouter.router.pop(),
                                iconData: MyFlutterApp.cancel,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                          ),
                          ArthOperationWidget(firstNum: '9', secondNum: '9')
                        ],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget userWidget(
      {required BuildContext context,
      required String imageName,
      required Color bgColor,
      required String text,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 180.w,
            height: 180.h,
            child: Image.asset(
              'assets/images/' + imageName,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor,
                    offset: Offset(0.w, 3.h),
                    blurRadius: 6.r)
              ],
              color: bgColor,
              shape: BoxShape.circle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        ],
      ),
    );
  }
}
