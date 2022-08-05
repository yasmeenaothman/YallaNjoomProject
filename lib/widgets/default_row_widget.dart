// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../models/language.dart';
// import '../models/my_flutter_app.dart';

// class DefaultRowWidget extends StatelessWidget {
//   Language language;
//   bool? isLetter;

//   DefaultRowWidget({
//     Key? key,
//     required this.language,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     isLetter = language is Letter;
//     return language.isLocked
//         ? Stack(
//             children: [
//               giveRow(context),
//               Positioned.fill(
//                 child: Container(
//                     decoration: BoxDecoration(
//                   color: const Color(0x8C000000),
//                   borderRadius: BorderRadius.circular(20.r),
//                 )),
//               )
//             ],
//           )
//         : giveRow(context);
//   }

//   Widget giveRatingBar({required double initialRating}) {
//     return RatingBar.builder(
//       unratedColor: isLetter! ? null : Colors.black,
//       initialRating: initialRating,
//       minRating: 0,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: 3,
//       itemSize: 15,
//       ignoreGestures: true,
//       itemPadding: const EdgeInsets.symmetric(horizontal: 4),
//       itemBuilder: (context, _) => const Icon(
//         MyFlutterApp.starFill,
//         color: Colors.amber,
//       ),
//       onRatingUpdate: (rating) {
//         print(rating);
//       },
//     );
//   }

//   Widget giveRow(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         /// here check if the letter opened then give the fit widget(lock icon or rating bar)
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(top: 12.h, left: 15.w),
//             child: language.isLocked
//                 ? Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Image.asset(
//                       'assets/images/${isLetter! ? 'lock' : 'b_lock'}.png',
//                       width: 16.w,
//                       height: 19.h,
//                     ),
//                   )
//                 : giveRatingBar(initialRating: 1),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Text(
//               language.name!, //'حرف الألف'
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 20.sp,
//                   color: isLetter! ? Colors.white : Colors.black,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ),
//         Container(
//           width: 74.w,
//           height: 75.h,
//           child: Center(
//             child: Text(
//               language.shape!,
//               style: TextStyle(
//                   fontSize: 55.sp,
//                   color: Theme.of(context).primaryColor,
//                   fontFamily: 'UrdType',
//                   height: 1.0),
//             ),
//           ),
//           decoration: BoxDecoration(
//               color: Color(isLetter! ? 0xFFFFDDAB : 0xFFFFDCD4),
//               borderRadius: BorderRadiusDirectional.only(
//                 topEnd: Radius.circular(20.r),
//                 bottomEnd: Radius.circular(20.r),
//               ),
//               boxShadow: language.isLocked
//                   ? []
//                   : [
//                       BoxShadow(
//                           offset: Offset(0, 3.h),
//                           blurRadius: 6.r,
//                           color: const Color(0x66074785))
//                     ]),
//         )
//       ],
//     );
//   }
// }
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/language.dart';
import '../models/my_flutter_app.dart';
import '../providers/firestore_provider.dart';

class DefaultRowWidget extends StatelessWidget {
  Language language;
  int nextIndex;
  bool? isLetter;
  int numOfStar;
  FirestoreProvider? provider;
  DefaultRowWidget({
    Key? key,
    required this.language,
    required this.nextIndex,
    required this.numOfStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    isLetter = language is Letter;
    return language.isLocked
        ? Stack(
            children: [
              giveRow(context),
              Positioned.fill(
                child: Container(
                    decoration: BoxDecoration(
                  color: const Color(0x8C000000),
                  borderRadius: BorderRadius.circular(20.r),
                )),
              )
            ],
          )
        : giveRow(context);
  }

  Widget giveRatingBar() {
    //provider!.numOfStar<2?null:nextIndex != -1?DummyData.dummyData.letters[nextIndex].isLocked = false:null;
    return RatingBar.builder(
      unratedColor: isLetter! ? null : Colors.black,
      initialRating: numOfStar.toDouble(),
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 3,
      itemSize: 15,
      ignoreGestures: true,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) {
        numOfStar < 2
            ? null
            : nextIndex != -1
                ? isLetter!
                    ? provider!.letters[nextIndex].isLocked = false
                    : provider!.numbers[nextIndex].isLocked = false
                : null;
        return const Icon(
          MyFlutterApp.starFill,
          color: Colors.amber,
        );
      },
      onRatingUpdate: (rating) {
        //numOfStar<2?null:nextIndex != -1? DummyData.dummyData.letters[nextIndex].isLocked = false:null;
        print(rating);
      },
    );
  }

  Widget giveRow(BuildContext context) {
    //provider?.getFromSharedPreference(language.name!);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// here check if the letter opened then give the fit widget(lock icon or rating bar)
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.h, left: 15.w),
            child: language.isLocked
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/${isLetter! ? 'lock' : 'b_lock'}.png',
                      width: 16.w,
                      height: 19.h,
                    ),
                  )
                : giveRatingBar(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              language.name!, //'حرف الألف'
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: isLetter! ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          width: 74.w,
          height: 75.h,
          child: Center(
            child: Text(
              isLetter!
                  ? language.shape!
                  : ArabicNumbers().convert(language.shape),
              style: TextStyle(
                  fontSize: 55.sp,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'UrdType',
                  height: 1.0),
            ),
          ),
          decoration: BoxDecoration(
              color: Color(isLetter! ? 0xFFFFDDAB : 0xFFFFDCD4),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(20.r),
                bottomEnd: Radius.circular(20.r),
              ),
              boxShadow: language.isLocked
                  ? []
                  : [
                      BoxShadow(
                          offset: Offset(0, 3.h),
                          blurRadius: 6.r,
                          color: const Color(0x66074785))
                    ]),
        )
      ],
    );
  }
}
