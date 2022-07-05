import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/display_number_screen.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import '../models/dummy_data.dart';
import '../widgets/default_row_widget.dart';
import '../widgets/default_stack_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/scaffold_with_background.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({Key? key}) : super(key: key);
  static const String routeName = 'NumbersScreen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
      drawer: const DrawerWidget(),
      appBarIsVisible: true,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: ListView.separated(
            padding: EdgeInsets.only(top: 65.h, bottom: 65.h),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                AppRouter.router.pushNamedWithReplacementFunction(
                    DisplayNumberScreen.routeName, 'assets/images/one.png');
              },
              child: DefaultStackWidget(
                imagePath:
                    'assets/images/1_flower.png', // 1_flower.png for number
                btn: DefaultElevatedButton(
                  onPressed: () {
                    AppRouter.router.pushNamedWithReplacementFunction(
                        DisplayNumberScreen.routeName, 'assets/images/one.png');
                  },
                  //const Color(0xFFFFA4AC) number color
                  bgColor: const Color(0xFFFFA4AC), // letter color
                  child: DefaultRowWidget(
                    language: DummyData.dummyData.numbers[index],
                  ),
                  size: Size(double.infinity, 75.h),
                  boxShadow: BoxShadow(
                      offset: Offset(3, 6.h),
                      blurRadius: 9.r,
                      color: const Color(0x4D074785)),
                  radius: 20.r,
                  top: 0,
                ),
                bottom: 35,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 100.h,
            ),
            itemCount: DummyData.dummyData.numbers.length,
          ),
        ),
      ),
    );
  }
}
