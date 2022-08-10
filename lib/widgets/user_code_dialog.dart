import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

import '../providers/firestore_provider.dart';

class UserCodeDialog extends StatefulWidget {
  const UserCodeDialog(
      {Key? key,
      required this.code,
      required this.onPressed,
      this.isForGame = false})
      : super(key: key);
  final String code;
  final Function() onPressed;

  final bool isForGame;

  @override
  State<UserCodeDialog> createState() => _UserCodeDialogState();
}

class _UserCodeDialogState extends State<UserCodeDialog>
    with TickerProviderStateMixin {
  late AnimationController textController;
  late AnimationController imageController;
  late Animation<double> animation;
  late FirestoreProvider provider;
  @override
  void initState() {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    textController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animation =
        CurvedAnimation(parent: textController, curve: Curves.bounceInOut);
    textController.forward();
    imageController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    provider.audioPlayer.dispose();
    textController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 325.w,
              height: widget.isForGame ? 214.h : 300.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: widget.isForGame
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: 10.w, left: 110.w, top: 86.h, bottom: 80.h),
                        child: Text(
                          'تحتاج لمزيد من الذهبيات هيا اجتهد',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          style: theme.textTheme.subtitle1
                              ?.merge(TextStyle(fontSize: 16.sp)),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ScaleTransition(
                            scale: Tween<double>(begin: 2, end: 1)
                                .animate(animation),
                            child: Text(
                              'انتبه',
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  color: Colors.red,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            'الرمز الخاص بك',
                            style: theme.textTheme.headline2,
                          ),
                          Text(
                            widget.code.toString(),
                            style: theme.textTheme.headline2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0.w),
                            child: SizedBox(
                              width: 180.w,
                              child: Text(
                                'احتفظ بالكود لتستطيع الدخول به مرة أخرى',
                                style: theme.textTheme.subtitle1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0.w),
                            child: DefaultElevatedButton(
                              top: 0,
                              child: Text(
                                'التالي',
                                style: theme.textTheme.headline3!
                                    .copyWith(color: Colors.white),
                              ),
                              radius: 10.r,
                              onPressed: widget.onPressed,
                              size: Size(178.w, 44.h),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      Rect.fromLTWH(-30.w, 20.h, 80.5.w, 89.6.h),
                      Size(185.5.w, 194.6.h)),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(-30.w, 30.h, 80.5.w, 89.6.h),
                      //TODO:  width: isForGame?140.w :185.5.w,
                      //    height: isForGame?184.h : 194.6.h,

                      Size(185.5.w, 194.6.h)),
                ).animate(CurvedAnimation(
                  parent: imageController,
                  curve: Curves.easeIn,
                )),
                child: Image.asset(
                  'assets/images/${widget.isForGame ? 'game_dialog.png' : 'code_dialog.png'}',
                  // width: 185.5.w,height: 194.6.h,
                )),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yalla_njoom/widgets/default_elevated_button.dart';

// class UserCodeDialog extends StatefulWidget {
//   const UserCodeDialog({Key? key, required this.code, required this.onPressed})
//       : super(key: key);
//   final String code;
//   final Function() onPressed;

//   @override
//   State<UserCodeDialog> createState() => _UserCodeDialogState();
// }

// class _UserCodeDialogState extends State<UserCodeDialog>
//     with TickerProviderStateMixin {
//   late AnimationController textController;
//   late AnimationController imageController;
//   late Animation<double> animation;
//   @override
//   void initState() {
//     textController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     imageController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200));

//     animation =
//         CurvedAnimation(parent: textController, curve: Curves.bounceInOut);
//     textController.forward();
//     imageController.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     imageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Center(
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//               width: 325.w,
//               height: 300.h,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.secondary,
//                 borderRadius: BorderRadius.circular(30.r),
//                 border: Border.all(
//                   color: theme.primaryColor,
//                   width: 3.0,
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ScaleTransition(
//                       scale: Tween<double>(begin: 2, end: 1).animate(animation),
//                       child: Text(
//                         'انتبه',
//                         style: TextStyle(
//                             fontFamily: 'Tajawal',
//                             color: Colors.red,
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     Text(
//                       'الرمز الخاص بك',
//                       style: theme.textTheme.headline2,
//                     ),
//                     Text(
//                       widget.code.toString(),
//                       style: theme.textTheme.headline2,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 20.0.w),
//                       child: SizedBox(
//                         width: 180.w,
//                         child: Text(
//                           'احتفظ بالكود لتستطيع الدخول به مرة أخرى',
//                           style: theme.textTheme.subtitle1,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 20.0.w),
//                       child: DefaultElevatedButton(
//                         top: 0,
//                         child: Text(
//                           'التالي',
//                           style: theme.textTheme.headline3!
//                               .copyWith(color: Colors.white),
//                         ),
//                         radius: 10.r,
//                         onPressed: widget.onPressed,
//                         size: Size(178.w, 44.h),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             PositionedTransition(
//                 rect: RelativeRectTween(
//                   begin: RelativeRect.fromSize(
//                       Rect.fromLTWH(-30.w, 20.h, 80.5.w, 89.6.h),
//                       Size(185.5.w, 194.6.h)),
//                   end: RelativeRect.fromSize(
//                       Rect.fromLTWH(-30.w, 30.h, 80.5.w, 89.6.h),
//                       Size(185.5.w, 194.6.h)),
//                 ).animate(CurvedAnimation(
//                   parent: imageController,
//                   curve: Curves.easeIn,
//                 )),
//                 child: Image.asset(
//                   'assets/images/code_dialog.png',
//                   // width: 185.5.w,height: 194.6.h,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }