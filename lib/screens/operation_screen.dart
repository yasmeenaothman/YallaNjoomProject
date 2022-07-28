import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';

import '../models/dummy_data.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/scaffold_with_background.dart';

class OperationScreen extends StatelessWidget {
  static String routeName = 'OperationScreen';
  const OperationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: AnimationList(
            padding: EdgeInsets.only(top: 50.h),
            children: DummyData.dummyData.operationTypes
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: DefaultStackWidget(
                      bottom: 30.h,
                      imagePath: e.image,
                      btn: DefaultElevatedButton(
                        onPressed: e.pressFun,
                        child: Text(e.name,
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        size: Size(double.infinity, 63.h),
                        boxShadow: BoxShadow(
                            offset: Offset(3, 6.h),
                            blurRadius: 9.r,
                            color: const Color(0x4D074785)),
                        radius: 20.r,
                        bgColor: e.bgColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          )
          // ListView.separated(
          //   padding: EdgeInsets.only(top: 120.h, bottom: 65.h),
          //   itemBuilder: (context, index) => DefaultStackWidget(
          //     bottom: 30.h,
          //     imagePath: DummyData.dummyData.operationTypes[index].image,
          //     btn: DefaultElevatedButton(
          //       onPressed: DummyData.dummyData.operationTypes[index].pressFun,
          //       child: Text(DummyData.dummyData.operationTypes[index].name,
          //           style: TextStyle(
          //               fontSize: 22.sp,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w500)),
          //       size: Size(double.infinity, 63.h),
          //       boxShadow: BoxShadow(
          //           offset: Offset(3, 6.h),
          //           blurRadius: 9.r,
          //           color: const Color(0x4D074785)),
          //       radius: 20.r,
          //       bgColor: DummyData.dummyData.operationTypes[index].bgColor,
          //     ),
          //   ),
          //   separatorBuilder: (context, index) => SizedBox(
          //     height: 100.h,
          //   ),
          //   itemCount: DummyData.dummyData.operationTypes.length,
          // ),
          ),
    );
  }
}
