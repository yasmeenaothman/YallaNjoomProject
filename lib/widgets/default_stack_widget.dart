import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

class DefaultStackWidget extends StatelessWidget {
  //TypeEducation type;
  String imagePath;
  DefaultElevatedButton btn;
  double bottom; // with row will be 25
  DefaultStackWidget({
    Key? key,
    //required this.type,
    required this.imagePath,
    required this.btn,
    this.bottom = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        btn,
        Positioned(
            bottom: bottom,
            child: Image.asset(
              //type.image,
              imagePath,
              height: 124.h,
              width: 127.w,
            ))
      ],
    );
  }
}
