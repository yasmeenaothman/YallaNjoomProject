import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithBorder extends StatelessWidget {
  String imageUrl;
  ImageWithBorder({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(

            ///this color will take from theme (primary color)
            color: const Color(0xFF074785),
            width: 2),
      ),
      child: Image.asset(imageUrl),
    );
  }
}
