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

// class LettersScreen extends StatelessWidget {
//   const LettersScreen({Key? key}) : super(key: key);
//   static const String routeName = 'LettersScreen';

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
//               children: DummyData.dummyData.letters
//                   .map(
//                     (e) => Padding(
//                       padding: EdgeInsets.symmetric(vertical: 50.h),
//                       child: GestureDetector(
//                         onTap: () {
//                           Provider.of<FirestoreProvider>(context, listen: false)
//                               .setSelectedLanguage(e);
//                           AppRouter.router.pushNamedWithReplacementFunction(
//                               LetterCardScreen.routeName);
//                         },
//                         child: DefaultStackWidget(
//                           //TODO: use the example here
//                           imagePath:
//                               'assets/images/lion.png', // 1_flower.png for number
//                           btn: DefaultElevatedButton(
//                             onPressed: () {
//                               Provider.of<FirestoreProvider>(context,
//                                       listen: false)
//                                   .setSelectedLanguage(e);
//                               AppRouter.router.pushNamedWithReplacementFunction(
//                                   LetterCardScreen.routeName);
//                             },
//                             //const Color(0xFFFFA4AC) number color
//                             bgColor: const Color(0xFF074785), // letter color
//                             child: DefaultRowWidget(
//                               language: e,
//                             ),
//                             size: Size(double.infinity, 75.h),
//                             boxShadow: BoxShadow(
//                                 offset: Offset(3, 6.h),
//                                 blurRadius: 9.r,
//                                 color: const Color(0x4D074785)),
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

//             ),
//       ),
//     );
//   }
// }
import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/letter_card_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import '../models/dummy_data.dart';
import '../providers/firestore_provider.dart';
import '../widgets/default_row_widget.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/scaffold_with_background.dart';

class LettersScreen extends StatelessWidget {
  LettersScreen({Key? key}) : super(key: key);
  static const String routeName = 'LettersScreen';
  int indexValue = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) => ScaffoldWithBackground(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
              itemBuilder: (context, index) {
                indexValue = index;
                indexValue++;
                return GestureDetector(
                  onTap: () {
                    indexValue <= provider.letters.length ? indexValue : -1;
                    provider.setSelectedLanguage(provider.letters[index]);
                    provider.selectedLanguage.isLocked
                        ? null
                        : AppRouter.router.pushNamedWithReplacementFunction(
                            LetterCardScreen.routeName);
                  },
                  child: DefaultStackWidget(
                    imagePath: provider.examples
                        .firstWhere((element) =>
                            provider.letters[index].id_example == element.id)
                        .img1!, // flower1.png for number
                    btn: DefaultElevatedButton(
                      onPressed: () {
                        provider.setSelectedLanguage(provider.letters[index]);
                        provider.selectedLanguage.isLocked
                            ? null
                            : AppRouter.router.pushNamedWithReplacementFunction(
                                LetterCardScreen.routeName);
                      },
                      //const Color(0xFFFFA4AC) number color
                      bgColor: const Color(0xFF074785), // letter color
                      child: DefaultRowWidget(
                        language: provider.letters[
                            index], //DummyData.dummyData.letters[index]
                        nextIndex: indexValue < provider.letters.length
                            ? indexValue
                            : -1,
                        numOfStar: 0,
                        // provider.allStarNum[index], //provider.numOfStar,
                      ),
                      size: Size(double.infinity, 75.h),
                      boxShadow: BoxShadow(
                          offset: Offset(3, 6.h),
                          blurRadius: 9.r,
                          color: const Color(0x4D074785)),
                      radius: 20.r,
                      top: 0,
                    ),
                    bottom: 35,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 100.h,
              ),
              itemCount: provider.letters.length,
            ),
          ),
        ),
      ),
    );
  }
}
