import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
import 'package:yalla_njoom/widgets/letter_cart_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

class LetterCardScreen extends StatelessWidget {
  const LetterCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            const Align(
                alignment: Alignment.centerLeft,
                child: DefaultCirculeAvatar(
                    imagePath: 'assets/images/close.png', padding: 15)),
            SizedBox(height: 17.h),
            const DefaultCirculeAvatar(imagePath: 'assets/images/listen.png'),
            SizedBox(height: 10.h),
            const DefaultCirculeAvatar(imagePath: 'assets/images/music.png'),
            SizedBox(height: 10.h),
            const DefaultCirculeAvatar(imagePath: 'assets/images/mic.png'),
            SizedBox(height: 10.h),
            const DefaultCirculeAvatar(
              imagePath: 'assets/images/arrow.png',
              padding: 12,
            ),
            SizedBox(height: 30.h),
            const LetterCardWidget(
                letter: 'ب', imagePath: 'assets/images/lion.png')
          ],
        ),
      ),
    );
  }
}
