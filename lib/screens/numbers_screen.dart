import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/display_number_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

import '../models/my_flutter_app.dart';
import '../models/solution.dart';
import '../providers/firestore_provider.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_row_widget.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/scaffold_with_background.dart';
import 'child_home_screen.dart';

class NumbersScreen extends StatelessWidget {
  NumbersScreen({Key? key}) : super(key: key);
  static const String routeName = 'NumbersScreen';
  int indexValue = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) {
        return ScaffoldWithBackground(
          body: provider.numbers.isEmpty
              ?  Center(
                  child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: theme.primaryColor,
                      rightDotColor: const Color(0xFFFFA4AC),
                      size: 50),
                )
              : Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: DefaultCirculeAvatar(
                            onTap: () => AppRouter.router.pop(),
                            iconData: MyFlutterApp.cancel,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                            child: provider.allSolutions.length != 38
                                ?  Center(
                                    child:LoadingAnimationWidget.twistingDots(
                                        leftDotColor: theme.primaryColor,
                                        rightDotColor: const Color(0xFFFFA4AC),
                                        size: 50))
                                : AnimationList(
                                    padding: EdgeInsets.only(top: 20.h),
                                    children: provider.numbers.map((e) {
                                      indexValue = index;
                                      indexValue++;
                                      var widget = Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40.h),
                                          child: GestureDetector(
                                            onTap: () {
                                              indexValue <=
                                                      provider.numbers.length
                                                  ? indexValue
                                                  : -1;
                                              provider.setSelectedLanguage(e);
                                              provider.selectedLanguage.isLocked
                                                  ? null
                                                  : AppRouter.router
                                                      .pushNamedWithReplacementFunction(
                                                          DisplayNumberScreen
                                                              .routeName,
                                                          'assets/images/one.png'); //TODO: search solution for this image
                                            },
                                            child: DefaultStackWidget(
                                              imagePath: e.imageUrl!,
                                              btn: DefaultElevatedButton(
                                                onPressed: () {
                                                  provider
                                                      .setSelectedLanguage(e);
                                                  provider.selectedLanguage
                                                          .isLocked
                                                      ? null
                                                      : AppRouter.router
                                                          .pushNamedWithReplacementFunction(
                                                              DisplayNumberScreen
                                                                  .routeName,
                                                              'assets/images/one.png'); //TODO: search solution for this image
                                                },
                                                //const Color(0xFFFFA4AC) number color
                                                bgColor:
                                                    const Color(0xFFFFA4AC),
                                                // letter color
                                                child: DefaultRowWidget(
                                                  language:
                                                      e, //DummyData.dummyData
                                                  nextIndex: indexValue <
                                                          provider
                                                              .numbers.length
                                                      ? indexValue
                                                      : -1,
                                                  /* ++index <= provider.numbers.length ? ++index : -1,*/
                                                  numOfStar: provider
                                                      .allSolutions
                                                      .firstWhere(
                                                        (element) =>
                                                            element.exampleId ==
                                                            e.exampleId,
                                                        orElse: () => Solution(
                                                            exampleId: 'أ'),
                                                      )
                                                      .numOfStars,

                                                  ///
                                                ),
                                                size:
                                                    Size(double.infinity, 75.h),
                                                boxShadow: BoxShadow(
                                                  offset: Offset(3, 6.h),
                                                  blurRadius: 9.r,
                                                  color:
                                                      const Color(0x4D074785),
                                                ),
                                                radius: 20.r,
                                                top: 0,
                                              ),
                                              bottom: 35,
                                            ),
                                          ));
                                      index++;
                                      return widget;
                                    }).toList(),
                                  )),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/display_number_screen.dart';
// import 'package:yalla_njoom/widgets/default_elevated_button.dart';
// import '../models/my_flutter_app.dart';
// import '../models/solution.dart';
// import '../providers/firestore_provider.dart';
// import '../widgets/default_circular_avatar.dart';
// import '../widgets/default_row_widget.dart';
// import '../widgets/default_stack_widget.dart';
// import '../widgets/scaffold_with_background.dart';
// import 'child_home_screen.dart';

// class NumbersScreen extends StatelessWidget {
//   NumbersScreen({Key? key}) : super(key: key);
//   static const String routeName = 'NumbersScreen';
//   int indexValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Consumer<FirestoreProvider>(
//       builder: (context, provider, x) {
//         return ScaffoldWithBackground(
//           body: provider.numbers.isEmpty
//               ? const Center(child: CircularProgressIndicator())
//               : Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: DefaultCirculeAvatar(
//                             onTap: () => AppRouter.router
//                                 .pushNamedWithReplacementFunction(
//                                     ChildHomeScreen.routeName),
//                             iconData: MyFlutterApp.cancel,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         Expanded(
//                           child: provider.allSolutions.length != 38
//                               ? const Center(child: CircularProgressIndicator())
//                               : ListView.separated(
//                                   padding:
//                                       EdgeInsets.only(top: 65.h, bottom: 65.h),
//                                   itemBuilder: (context, index) {
//                                     print(
//                                         "${provider.numbers.length} xxxxxxxxxxxxxxxxx");
//                                     indexValue = index;
//                                     indexValue++;
//                                     return GestureDetector(
//                                       onTap: () {
//                                         indexValue <= provider.numbers.length
//                                             ? indexValue
//                                             : -1;
//                                         provider.setSelectedLanguage(
//                                             provider.numbers[index]);
//                                         provider.selectedLanguage.isLocked
//                                             ? null
//                                             : AppRouter.router
//                                                 .pushNamedWithReplacementFunction(
//                                                     DisplayNumberScreen
//                                                         .routeName,
//                                                     'assets/images/one.png'); //TODO: search solution for this image
//                                       },
//                                       child: DefaultStackWidget(
//                                         imagePath:
//                                             provider.numbers[index].imageUrl!,
//                                         /* provider.examples
//                               .firstWhere((element) =>
//                                   provider.numbers[index].exampleId ==
//                                   element.exampleId)
//                               .img1!,*/
//                                         btn: DefaultElevatedButton(
//                                           onPressed: () {
//                                             provider.setSelectedLanguage(
//                                                 provider.numbers[index]);
//                                             provider.selectedLanguage.isLocked
//                                                 ? null
//                                                 : AppRouter.router
//                                                     .pushNamedWithReplacementFunction(
//                                                         DisplayNumberScreen
//                                                             .routeName,
//                                                         'assets/images/one.png'); //TODO: search solution for this image
//                                           },
//                                           //const Color(0xFFFFA4AC) number color
//                                           bgColor: const Color(
//                                               0xFFFFA4AC), // letter color
//                                           child: DefaultRowWidget(
//                                             language: provider.numbers[
//                                                 index], //DummyData.dummyData
//                                             nextIndex: indexValue <
//                                                     provider.numbers.length
//                                                 ? indexValue
//                                                 : -1,
//                                             /* ++index <= provider.numbers.length ? ++index : -1,*/
//                                             numOfStar: provider.allSolutions
//                                                 .firstWhere(
//                                                   (element) =>
//                                                       element.exampleId ==
//                                                       provider.numbers[index]
//                                                           .exampleId,
//                                                   orElse: () =>
//                                                       Solution(exampleId: 'أ'),
//                                                 )
//                                                 .numOfStars,

//                                             ///
//                                           ),
//                                           size: Size(double.infinity, 75.h),
//                                           boxShadow: BoxShadow(
//                                             offset: Offset(3, 6.h),
//                                             blurRadius: 9.r,
//                                             color: const Color(0x4D074785),
//                                           ),
//                                           radius: 20.r,
//                                           top: 0,
//                                         ),
//                                         bottom: 35,
//                                       ),
//                                     );
//                                   },
//                                   separatorBuilder: (context, index) =>
//                                       SizedBox(
//                                     height: 100.h,
//                                   ),
//                                   itemCount: provider.numbers.length,
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//         );
//       },
//     );
//   }
// }
