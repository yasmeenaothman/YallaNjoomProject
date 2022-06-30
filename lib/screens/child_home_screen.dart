import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/default_button.dart';

import '../models/dummy_data.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/scaffold_with_background.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'ChildHomeScreen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      drawer: const DrawerWidget(),
      appBarIsVisible: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
          itemBuilder: (context, index) => DefaultStackWidget(
            type: DummyData.dummyData.types[index],
            btn: DefaultButton(
              child: Text(DummyData.dummyData.types[index].name,
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              onPressed: () {},
              height: 63.h,
              width: double.infinity,
              boxShadow: BoxShadow(
                  offset: Offset(3, 6.h),
                  blurRadius: 9.r,
                  color: const Color(0x4D074785)),
              radius: 20.r,
              bgColor: DummyData.dummyData.types[index].bgColor,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 100.h,
          ),
          itemCount: DummyData.dummyData.types.length,
        ),
      ),
    );
  }
}
