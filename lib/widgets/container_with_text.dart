import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithText extends StatelessWidget {
  const ContainerWithText({Key? key}) : super(key: key);

  /// here only text name is different so you should make it on variable
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60.w),
      child: Container(
        width: 206.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 23.h),
        child: Text(
          'هيا نضغط على حيوان يبدأ بحرف الألف',
          softWrap: true,
          textDirection: TextDirection.rtl,
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w500,
            color: const Color(0xFF034C1B),
          ),
        ),
        decoration: BoxDecoration(
            color: const Color(0xFFDBECC2),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x66074785),
                  offset: Offset(0, 3.h),
                  blurRadius: 6.r)
            ],
            borderRadius: BorderRadiusDirectional.circular(33.r)),
      ),
    );
  }
}
