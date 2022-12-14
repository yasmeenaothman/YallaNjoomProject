import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/add_child_info_screen.dart';
import 'package:yalla_njoom/widgets/drawer_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/my_flutter_app.dart';
import '../widgets/default_child_card.dart';
import 'child_tracker_screen.dart';

class ParentsHomeScreen extends StatefulWidget {
  const ParentsHomeScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'ParentsHomeScreen';

  @override
  State<ParentsHomeScreen> createState() => _ParentsHomeScreenState();
}

class _ParentsHomeScreenState extends State<ParentsHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  String searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true,);


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Consumer<FirestoreProvider>(
      builder: (context, firestoreProvider, x) {
        return ScaffoldWithBackground(
            drawer: const DrawerWidget(),
            appBarIsVisible: true,
            floatingActionButton: _buildFabWidget(theme),
            body: Center(
              heightFactor: 3,
              child: firestoreProvider.parentsChildren.isNotEmpty
                  ? _buildChildrenListWidget(firestoreProvider)
                  : _buildNoChildWidget(theme, '???? ?????? ?????????? ???? ??????'),
            ));
      },
    );
  }

  Padding _buildChildrenListWidget(FirestoreProvider firestoreProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w, bottom: 33.h),
            child: Text(
              '?????????? ??????????????',
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
              onChanged: (query) {
                searchQuery = query;
                setState(() {});
                print(query);
                firestoreProvider.getNamesDetailList(
                    query, firestoreProvider.userModel!.code);
              },
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
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
                hintText: "??????????",
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
          searchQuery.isNotEmpty
              ? firestoreProvider.searchResult.isNotEmpty
                  ? resultExist(firestoreProvider)
                  : Center(
                      child: _buildNoChildWidget(
                          Theme.of(context), '???? ???????? ??????????'),
                    )
              : childrenList(firestoreProvider),

          // Expanded(
          //   child: ListView.separated(
          //     itemBuilder: (context, index) {
          //       return firestoreProvider.searchResutl.isNotEmpty
          //           ? DefaultKidCard(
          //               childModel: firestoreProvider.searchResutl[index])
          //           : DefaultKidCard(
          //               childModel: firestoreProvider.parentsChildren[index]);
          //     },
          //     separatorBuilder: (context, index) => SizedBox(
          //       height: 20.h,
          //     ),
          //     itemCount: firestoreProvider.searchResutl.isNotEmpty
          //         ? firestoreProvider.searchResutl.length
          //         : firestoreProvider.parentsChildren.length,
          //   ),
          // ),
        ],
      ),
    );
  }

  Expanded childrenList(FirestoreProvider firestoreProvider) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return DefaultChildCard(
            childModel: firestoreProvider.parentsChildren[index],
            onTap: () {
              setChildPressed(
                  childCode:
                      (firestoreProvider.parentsChildren[index] as ChildModel)
                          .code,
                  provider: firestoreProvider);
              AppRouter.router.pushNamedFunction(ChildTrackerScreen.routeName);
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 20.h,
        ),
        itemCount: firestoreProvider.parentsChildren.length,
      ),
    );
  }

  Expanded resultExist(FirestoreProvider firestoreProvider) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return DefaultChildCard(
                onTap: () {
                  setChildPressed(
                      childCode:
                          (firestoreProvider.searchResult[index] as ChildModel)
                              .code,
                      provider: firestoreProvider);
                  AppRouter.router
                      .pushNamedFunction(ChildTrackerScreen.routeName);
                },
                childModel: firestoreProvider.searchResult[index]);
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
          itemCount: firestoreProvider.searchResult.length),
    );
  }

  setChildPressed({required childCode, required FirestoreProvider provider}) {
    provider.setChildPressedByParent(childCode: childCode);
  }

  Column _buildNoChildWidget(ThemeData theme, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
            turns: Tween<double>(begin: -0.05, end: 0.05).animate(animation),
            child: Image.asset('assets/images/unhappy_star.png')),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
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
            AppRouter.router.pushNamedFunction(AddChildInfoScreen.routeName);
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
