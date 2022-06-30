import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/add_child_info_screen.dart';
import 'package:yalla_njoom/widgets/drawer_widget.dart';

import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'ParentsHomeScreen';

  final bool allChildren =
      false; //TODO: must be a list of parents' children not a bool
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
              ? Container() //TODO: must add a list of parents' children
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
