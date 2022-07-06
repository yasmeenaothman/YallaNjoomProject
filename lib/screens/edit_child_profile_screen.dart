import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/kid.dart';
import '../widgets/default_elevated_button.dart';

class EditKidProfile extends StatelessWidget {
  EditKidProfile({Key? key, required this.kid}) : super(key: key);
  Kid kid;
  static String routeName = 'EditKidProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 88.h,
              ),
              //TODO:make the image.network because it token from firebase
              Image.asset(
                kid.imageUrl!,
                height: 127.h,
                width: 127.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'تعديل',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF074785),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                kid.code!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF074785),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'الاسم:',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF074785),
                  ),
                ),
              ),
              // SizedBox(height: 10.h,),
              TextField(
                maxLines: 1,
                cursorColor: const Color(0x82074785),
                cursorHeight: 24.h,
                cursorWidth: 1.w,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: kid.name!,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0x45544F4F))),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF074785)),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              DefaultElevatedButton(
                onPressed: () {},
                top: 5.h,
                radius: 10.r,
                boxShadow: const BoxShadow(color: Colors.white),
                size: Size(136.w, 50.h),
                child: Text(
                  'حفظ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
