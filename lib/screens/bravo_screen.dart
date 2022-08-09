// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/models/user_model.dart';
// import 'package:yalla_njoom/providers/firestore_provider.dart';
// import 'package:yalla_njoom/screens/child_home_screen.dart';
// import 'package:yalla_njoom/screens/letter_card_screen.dart';
// import 'package:yalla_njoom/screens/parents_home_screen.dart';

// import 'package:yalla_njoom/widgets/bravo_dialog.dart';
// import 'package:yalla_njoom/widgets/default_circular_avatar.dart';

// import '../models/my_flutter_app.dart';
// import '../routers/app_router.dart';

// class BravoScreen extends StatefulWidget {
//   static const String routeName = 'BravoScreen';

//   const BravoScreen(
//       {Key? key, required this.isPronunciationWidget, required this.onPressed})
//       : super(key: key);
//   final bool isPronunciationWidget;
//   final Function() onPressed;

//   @override
//   State<BravoScreen> createState() => _BravoScreenState();
// }

// class _BravoScreenState extends State<BravoScreen>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));

//     animation = CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
//     controller.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             ScaleTransition(
//               child: Image.asset(
//                 'assets/images/bravo_background.png',
//                 fit: BoxFit.fitHeight,
//               ),
//               scale: Tween<double>(begin: 1, end: 1.5).animate(animation),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.w),
//                     child: DefaultCirculeAvatar(
//                       onTap: () => AppRouter.router
//                           .pushNamedWithReplacementFunction(
//                               ChildHomeScreen.routeName,
//                               Provider.of<FirestoreProvider>(context,
//                                       listen: false)
//                                   .userModel as ChildModel),
//                       iconData: MyFlutterApp.cancel,
//                     )),
//                 Expanded(
//                   child: BravoDialog(
//                     imagePath: 'assets/images/lion.png',
//                     widget: bravoBottomWidget(
//                         theme, 'هيا ننتقل للمثال التالي', widget.onPressed),
//                     isPronunciationWidget: widget.isPronunciationWidget,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Column bravoBottomWidget(
//           ThemeData theme, String text, Function() onPressed) =>
//       Column(
//         children: [
//           SizedBox(
//             height: 30.h,
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Text(
//               text,
//               style: theme.textTheme.headline1!.copyWith(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 40.h,
//           ),
//           GestureDetector(
//             onTap: onPressed,
//             child: Image.asset(
//               'assets/images/yellow_arrow.png',
//               width: 55.w,
//               height: 48.h,
//             ),
//           )
//         ],
//       );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/widgets/bravo_dialog.dart';
import 'package:yalla_njoom/widgets/default_circular_avatar.dart';

import '../models/my_flutter_app.dart';

class BravoScreen extends StatefulWidget {
  static const String routeName = 'BravoScreen';

  const BravoScreen(
      {Key? key,
      this.lastExample = false,
      required this.isPronunciationWidget,
      required this.onPressed,
      required this.onTab})
      : super(key: key);
  final bool isPronunciationWidget;
  final Function() onPressed;
  final Function() onTab;
  final bool lastExample;

  @override
  State<BravoScreen> createState() => _BravoScreenState();
}

class _BravoScreenState extends State<BravoScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late FirestoreProvider provider;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ScaleTransition(
              child: Image.asset(
                'assets/images/bravo_background.png',
                fit: BoxFit.fitHeight,
              ),
              scale: Tween<double>(begin: 1, end: 1.5).animate(animation),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: DefaultCirculeAvatar(
                      onTap: widget.onTab,
                      iconData: MyFlutterApp.cancel,
                    )),
                Expanded(
                  child: BravoDialog(
                    imagePath: 'assets/images/lion.png',
                    widget: bravoBottomWidget(
                        theme, 'هيا ننتقل للمثال التالي', widget.onPressed),
                    isPronunciationWidget: widget.isPronunciationWidget,
                    lastExample: widget.lastExample,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column bravoBottomWidget(
          ThemeData theme, String text, Function() onPressed) =>
      Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Visibility(
            visible: widget.lastExample ? false : true,
            // ? true
            // : provider.allSolutions
            //         .firstWhere((element) =>
            //             element.exampleId ==
            //             provider.selectedLanguage.exampleId)
            //         .numOfSolutions !=
            //     3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
                style: theme.textTheme.headline1!.copyWith(color: Colors.white),
              ),
            ),
          ),
          Visibility(
            visible: widget.lastExample ? false : true,
            //  provider.selectedLanguage == null
            //     ? true
            //     : provider.allSolutions
            //             .firstWhere((element) =>
            //                 element.exampleId ==
            //                 provider.selectedLanguage.exampleId)
            //             .numOfSolutions !=
            //         3,
            child: SizedBox(
              height: 40.h,
            ),
          ),
          Visibility(
            visible: widget.lastExample ? false : true,
            // provider.selectedLanguage == null
            //     ? true
            //     : provider.allSolutions
            //             .firstWhere((element) =>
            //                 element.exampleId ==
            //                 provider.selectedLanguage.exampleId)
            //             .numOfSolutions !=
            //         3,
            child: GestureDetector(
              onTap: onPressed,
              child: Image.asset(
                'assets/images/yellow_arrow.png',
                width: 55.w,
                height: 48.h,
              ),
            ),
          )
        ],
      );
}
