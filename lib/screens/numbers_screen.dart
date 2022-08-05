// import 'package:animation_list/animation_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/display_number_screen.dart';
// import 'package:yalla_njoom/widgets/default_elevated_button.dart';
// import '../models/dummy_data.dart';
// import '../widgets/default_row_widget.dart';
// import '../widgets/default_stack_widget.dart';
// import '../widgets/drawer_widget.dart';
// import '../widgets/scaffold_with_background.dart';

// class NumbersScreen extends StatelessWidget {
//   const NumbersScreen({Key? key}) : super(key: key);
//   static const String routeName = 'NumbersScreen';

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return ScaffoldWithBackground(
//       body: Directionality(
//         textDirection: TextDirection.ltr,
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
//             child: AnimationList(
//               padding: EdgeInsets.only(top: 50.h),
//               children: DummyData.dummyData.numbers
//                   .map(
//                     (e) => Padding(
//                       padding: EdgeInsets.symmetric(vertical: 50.h),
//                       child: GestureDetector(
//                         onTap: () {
//                           AppRouter.router.pushNamedWithReplacementFunction(
//                               DisplayNumberScreen.routeName,
//                               'assets/images/one.png');
//                         },
//                         child: DefaultStackWidget(
//                           imagePath:
//                               'assets/images/1_flower.png', // 1_flower.png for number
//                           btn: DefaultElevatedButton(
//                             onPressed: () {
//                               AppRouter.router.pushNamedWithReplacementFunction(
//                                   DisplayNumberScreen.routeName,
//                                   'assets/images/one.png');
//                             },
//                             //const Color(0xFFFFA4AC) number color
//                             bgColor: const Color(0xFFFFA4AC), // letter color
//                             child: DefaultRowWidget(
//                               language: e,
//                             ),
//                             size: Size(double.infinity, 75.h),
//                             boxShadow: BoxShadow(
//                               offset: Offset(3, 6.h),
//                               blurRadius: 9.r,
//                               color: const Color(0x4D074785),
//                             ),
//                             radius: 20.r,
//                             top: 0,
//                           ),
//                           bottom: 35,
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             )

//             // ListView.separated(
//             //   padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
//             //   itemBuilder: (context, index) => GestureDetector(
//             //     onTap: () {
//             //       AppRouter.router.pushNamedWithReplacementFunction(
//             //           DisplayNumberScreen.routeName, 'assets/images/one.png');
//             //     },
//             //     child: DefaultStackWidget(
//             //       imagePath:
//             //           'assets/images/1_flower.png', // 1_flower.png for number
//             //       btn: DefaultElevatedButton(
//             //         onPressed: () {
//             //           AppRouter.router.pushNamedWithReplacementFunction(
//             //               DisplayNumberScreen.routeName, 'assets/images/one.png');
//             //         },
//             //         //const Color(0xFFFFA4AC) number color
//             //         bgColor: const Color(0xFFFFA4AC), // letter color
//             //         child: DefaultRowWidget(
//             //           language: DummyData.dummyData.numbers[index],
//             //         ),
//             //         size: Size(double.infinity, 75.h),
//             //         boxShadow: BoxShadow(
//             //           offset: Offset(3, 6.h),
//             //           blurRadius: 9.r,
//             //           color: const Color(0x4D074785),
//             //         ),
//             //         radius: 20.r,
//             //         top: 0,
//             //       ),
//             //       bottom: 35,
//             //     ),
//             //   ),
//             //   separatorBuilder: (context, index) => SizedBox(
//             //     height: 100.h,
//             //   ),
//             //   itemCount: DummyData.dummyData.numbers.length,
//             // ),

//             ),
//       ),
//     );
//   }
// }

// import 'package:animation_list/animation_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/letter_card_screen.dart';
// import 'package:yalla_njoom/widgets/default_elevated_button.dart';
// import '../models/dummy_data.dart';
// import '../providers/firestore_provider.dart';
// import '../widgets/default_row_widget.dart';
// import '../widgets/default_stack_widget.dart';
// import '../widgets/drawer_widget.dart';
// import '../widgets/scaffold_with_background.dart';
// import 'display_number_screen.dart';

// class NumbersScreen extends StatelessWidget {
//   NumbersScreen({Key? key}) : super(key: key);
//   static const String routeName = 'NumbersScreen';
//   int indexValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Consumer<FirestoreProvider>(
//         builder: (context, provider, x) => ScaffoldWithBackground(
//               body: Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
//                     child: AnimationList(
//                       padding: EdgeInsets.only(top: 50.h),
//                       children: DummyData.dummyData.numbers.map(
//                         (e) {
//                           int index = DummyData.dummyData.numbers.indexOf(e);
//                           indexValue =
//                               index; //TODO: IAM NOT SURE THAT THIS WILL WORK
//                           indexValue++;
//                           return Padding(
//                             padding: EdgeInsets.symmetric(vertical: 50.h),
//                             child: GestureDetector(
//                               onTap: () {
//                                 indexValue <= provider.numbers.length
//                                     ? indexValue
//                                     : -1;
//                                 provider.selectedLanguage.isLocked
//                                     ? null
//                                     : AppRouter.router
//                                         .pushNamedWithReplacementFunction(
//                                             DisplayNumberScreen.routeName,
//                                             'assets/images/one.png'); //TODO: search solution for this image
//                               },
//                               child: DefaultStackWidget(
//                                 //TODO: use the example here
//                                 imagePath: provider.examples
//                                     .firstWhere((element) =>
//                                         provider.numbers[index].id_example ==
//                                         element.id)
//                                     .img1!, // flower1.png for number
//                                 btn: DefaultElevatedButton(
//                                   onPressed: () {
//                                     provider.setSelectedLanguage(
//                                         provider.numbers[index]);
//                                     provider.selectedLanguage.isLocked
//                                         ? null
//                                         : AppRouter.router
//                                             .pushNamedWithReplacementFunction(
//                                                 DisplayNumberScreen.routeName,
//                                                 'assets/images/one.png'); //TODO: search solution for this image
//                                   },
//                                   //const Color(0xFFFFA4AC) number color
//                                   bgColor:
//                                       const Color(0xFF074785), // letter color
//                                   child: DefaultRowWidget(
//                                     language: provider
//                                         .numbers[index], //DummyData.dummyData
//                                     nextIndex:
//                                         ++index <= provider.numbers.length
//                                             ? ++index
//                                             : -1,
//                                     numOfStar: 2,
//                                   ),
//                                   size: Size(double.infinity, 75.h),
//                                   boxShadow: BoxShadow(
//                                       offset: Offset(3, 6.h),
//                                       blurRadius: 9.r,
//                                       color: const Color(0x4D074785)),
//                                   radius: 20.r,
//                                   top: 0,
//                                 ),
//                                 bottom: 35,
//                               ),
//                             ),
//                           );
//                         },
//                       ).toList(),
//                     )),
//               ),
//             ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) {
        return ScaffoldWithBackground(
          body: provider.numbers.isEmpty
              ? const Center(child: CircularProgressIndicator())
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
                            onTap: () => AppRouter.router
                                .pushNamedWithReplacementFunction(
                                    ChildHomeScreen.routeName),
                            iconData: MyFlutterApp.cancel,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                          child: provider.allSolutions.length != 38
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.separated(
                                  padding:
                                      EdgeInsets.only(top: 65.h, bottom: 65.h),
                                  itemBuilder: (context, index) {
                                    print(
                                        "${provider.numbers.length} xxxxxxxxxxxxxxxxx");
                                    indexValue = index;
                                    indexValue++;
                                    return GestureDetector(
                                      onTap: () {
                                        indexValue <= provider.numbers.length
                                            ? indexValue
                                            : -1;
                                        provider.setSelectedLanguage(
                                            provider.numbers[index]);
                                        provider.selectedLanguage.isLocked
                                            ? null
                                            : AppRouter.router
                                                .pushNamedWithReplacementFunction(
                                                    DisplayNumberScreen
                                                        .routeName,
                                                    'assets/images/one.png'); //TODO: search solution for this image
                                      },
                                      child: DefaultStackWidget(
                                        imagePath:
                                            provider.numbers[index].imageUrl!,
                                        /* provider.examples
                              .firstWhere((element) =>
                                  provider.numbers[index].exampleId ==
                                  element.exampleId)
                              .img1!,*/
                                        btn: DefaultElevatedButton(
                                          onPressed: () {
                                            provider.setSelectedLanguage(
                                                provider.numbers[index]);
                                            provider.selectedLanguage.isLocked
                                                ? null
                                                : AppRouter.router
                                                    .pushNamedWithReplacementFunction(
                                                        DisplayNumberScreen
                                                            .routeName,
                                                        'assets/images/one.png'); //TODO: search solution for this image
                                          },
                                          //const Color(0xFFFFA4AC) number color
                                          bgColor: const Color(
                                              0xFFFFA4AC), // letter color
                                          child: DefaultRowWidget(
                                            language: provider.numbers[
                                                index], //DummyData.dummyData
                                            nextIndex: indexValue <
                                                    provider.numbers.length
                                                ? indexValue
                                                : -1,
                                            /* ++index <= provider.numbers.length ? ++index : -1,*/
                                            numOfStar: provider.allSolutions
                                                .firstWhere(
                                                  (element) =>
                                                      element.exampleId ==
                                                      provider.numbers[index]
                                                          .exampleId,
                                                  orElse: () =>
                                                      Solution(exampleId: 'أ'),
                                                )
                                                .numOfStars,

                                            ///
                                          ),
                                          size: Size(double.infinity, 75.h),
                                          boxShadow: BoxShadow(
                                            offset: Offset(3, 6.h),
                                            blurRadius: 9.r,
                                            color: const Color(0x4D074785),
                                          ),
                                          radius: 20.r,
                                          top: 0,
                                        ),
                                        bottom: 35,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 100.h,
                                  ),
                                  itemCount: provider.numbers.length,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
