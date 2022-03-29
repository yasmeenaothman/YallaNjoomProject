import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LetterCard extends StatelessWidget {
  const LetterCard({Key? key, required this.letter, required this.imagePath})
      : super(key: key);
  final String letter;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 325.w,
        height: 242.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x66074785),
              offset: Offset(0, 3.h),
              blurRadius: 6.r,
            )
          ],
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/letter_card_bg.png',
              )),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset('assets/images/lion.png'),
            Container(
              width: 116.w,
              height: 242.h,
              decoration: const BoxDecoration(
                color: Color(0xFF034C1B),
              ),
              child: Center(
                  child: Text(
                'أ',
                style: TextStyle(
                    fontFamily: 'Urdu', fontSize: 147.sp, color: Colors.white),
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
