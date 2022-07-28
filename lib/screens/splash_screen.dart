import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import 'do_u_have_acc_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    Provider.of<FirestoreProvider>(context, listen: false).initUsersCodes();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat();
    Timer(const Duration(seconds: 3), () {
      AppRouter.router
          .pushNamedWithReplacementFunction(DoYouHaveAccScreen.routeName);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        body: Center(
      child: ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animation),
        child: RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(animation),
          child: Image.asset(
            'assets/images/logo.png',
            width: 222.51.w,
            height: 203.79.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
