import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/enter_your_code_screen.dart';
import 'package:yalla_njoom/screens/user_type_screen.dart';
import 'package:yalla_njoom/widgets/arithmetic_operation_widget.dart';

import 'package:yalla_njoom/widgets/confirm_button_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../widgets/custom_dialog.dart';
import 'do_u_have_acc_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AppRouter.router
          .pushNamedWithReplacementFunction(DoYouHaveAccScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        body: Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 222.51.w,
        height: 203.79.h,
        fit: BoxFit.cover,
      ),
    ));
  }
}
