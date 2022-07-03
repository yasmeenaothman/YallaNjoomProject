import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/add_child_info_screen.dart';
import 'package:yalla_njoom/widgets/drawer_widget.dart';

import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/dummy_data.dart';
import '../models/my_flutter_app.dart';
import '../widgets/default_kid_card.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'ParentsHomeScreen';
  final bool allChildren =
      true; //TODO: must be a list of parents' children not a bool
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
        drawer: const DrawerWidget(),
        appBarIsVisible: true,
        floatingActionButton: _buildFabWidget(theme),
        body: Center(
          heightFactor: 3,
          child: allChildren
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w, bottom: 33.h),
                        child: Text(
                          'قائمة الأطفال',
                          softWrap: true,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF074785),
                          ),
                        ),
                      ),
                      // TODO: make the search bar here
                      Material(
                        elevation: 10,
                        shadowColor: const Color(0x2B074785),
                        borderRadius: BorderRadius.circular(10.r),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 20.w),
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                    width: 0.8, color: Colors.transparent)),
                            hintText: "البحث",
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              color: const Color(0x784B4B4B),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(left: 14.w),
                              child: const Icon(
                                MyFlutterApp.search,
                                size: 22,
                                color: Color(0xFF074785),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => DefaultKidCard(
                          kid: DummyData.dummyData.kids[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                        itemCount: DummyData.dummyData.kids.length,
                      ),
                    ],
                  ),
                )
              //TODO: must add a list of parents' children
              : _buildNoChildAddedWidget(theme),
        ));
  }

  Column _buildNoChildAddedWidget(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/unhappy_star.png'),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'لم يتم إضافة أي طفل',
          style: theme.textTheme.headline1!.copyWith(fontSize: 20.sp),
        )
      ],
    );
  }

  SizedBox _buildFabWidget(ThemeData theme) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            AppRouter.router
                .pushNamedWithReplacementFunction(AddChildInfoScreen.routeName);
          },
          backgroundColor: theme.primaryColor,
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
