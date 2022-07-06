// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yalla_njoom/widgets/default_elevated_button.dart';
// import '../models/dummy_data.dart';
// import '../widgets/default_row_widget.dart';
// import '../widgets/default_stack_widget.dart';
// import '../widgets/drawer_widget.dart';
// import '../widgets/scaffold_with_background.dart';

// class ChildHomeScreen extends StatelessWidget {
//   const ChildHomeScreen({Key? key}) : super(key: key);
//   static const String routeName = 'ChildHomeScreen';

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return ScaffoldWithBackground(
//       drawer: const DrawerWidget(),
//       appBarIsVisible: true,
//       body: Directionality(
//         textDirection: TextDirection.ltr,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
//           child: ListView.separated(
//             padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
//             itemBuilder: (context, index) => DefaultStackWidget(
//               onPressed: () {},
//               imagePath: 'assets/images/lion.png', // 1_flower.png for number
//               btn: DefaultElevatedButton(
//                 onPressed: () {},
//                 //const Color(0xFFFFA4AC) number color
//                 bgColor: const Color(0xFF074785), // letter color
//                 child: DefaultRowWidget(
//                   language: DummyData.dummyData.letters[index],
//                 ),
//                 size: Size(double.infinity, 75.h),
//                 boxShadow: BoxShadow(
//                     offset: Offset(3, 6.h),
//                     blurRadius: 9.r,
//                     color: const Color(0x4D074785)),
//                 radius: 20.r,
//                 top: 0,
//               ),
//               bottom: 35,
//             ),
//             separatorBuilder: (context, index) => SizedBox(
//               height: 100.h,
//             ),
//             itemCount: DummyData.dummyData.letters.length,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import '../models/dummy_data.dart';
import '../widgets/default_row_widget.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/scaffold_with_background.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'ChildHomeScreen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      drawer: const DrawerWidget(
        isParent: false,
      ),
      appBarIsVisible: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
          itemBuilder: (context, index) => GestureDetector(
            onTap: DummyData.dummyData.types[index].pressFun,
            child: DefaultStackWidget(
              imagePath: DummyData.dummyData.types[index].image,
              btn: DefaultElevatedButton(
                child: Text(DummyData.dummyData.types[index].name,
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                onPressed: DummyData.dummyData.types[index].pressFun,
                size: Size(double.infinity, 63.h),
                boxShadow: BoxShadow(
                    offset: Offset(3, 6.h),
                    blurRadius: 9.r,
                    color: const Color(0x4D074785)),
                radius: 20.r,
                bgColor: DummyData.dummyData.types[index].bgColor,
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 100.h,
          ),
          itemCount: DummyData.dummyData.types.length,
        ),
      ),
    );
  }

  // void navigateToScreen({required int index}) {
  //   switch (index) {
  //     case 0:
  //       AppRouter.router
  //           .pushNamedWithReplacementFunction(LettersScreen.routeName);
  //       break;
  //     case 1:
  //       AppRouter.router
  //           .pushNamedWithReplacementFunction(NumbersScreen.routeName);
  //       break;
  //     case 2:
  //       break;
  //     case 3:
  //       break;
  //     case 4:
  //       break;
  //   }
  // }
}
