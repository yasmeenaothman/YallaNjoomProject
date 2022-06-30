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
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

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
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 180.w,
                  height: 180.h,
                  child: Image.asset(
                    'assets/images/child_user.png',
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: Offset(0.w, 3.h),
                          blurRadius: 6.r)
                    ],
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Text(
                    'طفل',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 180.w,
                  height: 180.h,
                  child: Image.asset('assets/images/parent_user.png'),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: Offset(0.w, 3.h),
                          blurRadius: 6.r)
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Text(
                    'ولي أمر',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
