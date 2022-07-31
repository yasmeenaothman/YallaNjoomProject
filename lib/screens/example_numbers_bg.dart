// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yalla_njoom/screens/numbers_screen.dart';
// import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

// import '../models/my_flutter_app.dart';
// import '../routers/app_router.dart';
// import '../widgets/default_circular_avatar.dart';

// class ExampleNumbers extends StatelessWidget {
//   static String routeName = 'ExampleNumbers';

//   const ExampleNumbers({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return ScaffoldWithBackground(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.w),
//         child: Column(
//           children: [
//             SizedBox(height: 50.h),
//             Align(
//                 alignment: Alignment.centerLeft,
//                 child: DefaultCirculeAvatar(
//                   onTap: () => AppRouter.router
//                       .pushNamedWithReplacementFunction(
//                           NumbersScreen.routeName),
//                   iconData: MyFlutterApp.cancel,
//                 )),
//             SizedBox(height: 250.h),
//             Container(
//               width: 306.w,
//               height: 65.h,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.secondary,
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(3, 6.h),
//                     blurRadius: 9.r,
//                     color: const Color(0x4D074785),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(33.r),
//               ),
//               child: Center(
//                 child: Text(
//                   'هيا نضغط على عنصر واحد ',
//                   style: theme.textTheme.headline1,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 circularBorder(theme, 'assets/images/1_flower.png'),
//                 circularBorder(theme, 'assets/images/1_flower.png'),
//                 circularBorder(theme, 'assets/images/1_flower.png'),
//               ],
//             )
//           ],
//         ),
//       ),
//       bgImage: 'assets/images/number_example_bg.png',
//     );
//   }

//   Container circularBorder(ThemeData theme, String imagePath) {
//     return Container(
//       width: 95.w,
//       height: 95.h,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             width: 3.0,
//             color: theme.primaryColor,
//           )),
//       child: Image.asset(imagePath),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';

class ExampleNumbers extends StatelessWidget {
  static String routeName = 'ExampleNumbers';

  const ExampleNumbers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Align(
                alignment: Alignment.centerLeft,
                child: DefaultCirculeAvatar(
                  onTap: () => AppRouter.router
                      .pushNamedWithReplacementFunction(
                          NumbersScreen.routeName),
                  iconData: MyFlutterApp.cancel,
                )),
            SizedBox(height: 250.h),
            Container(
              width: 306.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 6.h),
                    blurRadius: 9.r,
                    color: const Color(0x4D074785),
                  ),
                ],
                borderRadius: BorderRadius.circular(33.r),
              ),
              child: Center(
                child: Text(
                  'هيا نضغط على عنصر واحد ',
                  style: theme.textTheme.headline1,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                circularBorder(theme, 'assets/images/flower1.png'),
                circularBorder(theme, 'assets/images/flower1.png'),
                circularBorder(theme, 'assets/images/flower1.png'),
              ],
            )
          ],
        ),
      ),
      bgImage: 'assets/images/number_example_bg.png',
    );
  }

  Container circularBorder(ThemeData theme, String imagePath) {
    return Container(
      width: 95.w,
      height: 95.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3.0,
            color: theme.primaryColor,
          )),
      child: Image.asset(imagePath),
    );
  }
}
