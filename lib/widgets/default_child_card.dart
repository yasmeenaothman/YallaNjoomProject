import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_tracker_screen.dart';
import 'package:yalla_njoom/widgets/image_with_border.dart';

class DefaultChildCard extends StatelessWidget {
  ChildModel childModel;
  DefaultChildCard({Key? key, required this.childModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          AppRouter.router.pushNamedFunction(ChildTrackerScreen.routeName);
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
            child: Row(
              children: [
                /// for image will be shared
                ImageWithBorder(
                  imageUrl: childModel.imageUrl!,
                ),
                SizedBox(
                  width: 25.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///textStyle i will take from theme
                      Text(
                        'الاسم : ${childModel.name}',
                        style: TextStyle(
                            color: const Color(0xFF074785),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' الرمز : ${childModel.code}',
                        style: TextStyle(
                            color: const Color(0xFF074785),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  alignment: Alignment.centerLeft,
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF074785)),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: const Color(0xFFD8EBF7),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x80074785),
                      offset: Offset(3.w, 6.h),
                      blurRadius: 9.r)
                ])),
      ),
    );
  }
}
