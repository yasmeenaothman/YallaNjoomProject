import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/confirm_button_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../widgets/custom_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSplashScreen = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isSplashScreen = false;
      });
    });
  }

  static const assetsImages = 'assets/images/';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      body: isSplashScreen ? _buildSplashLogo() : _buildConfirmDialog(),
    );
  }

  Column _buildConfirmDialog() {
    return Column(
      children: [
        SizedBox(
          height: 160.h,
        ),
        CustomDialog(
          text: 'هل لديك حساب؟',
          spaceBeforeWidget: 20.h,
          widget: ConfirmButtonWidget(
            confirmButtonFun: () {
              //TODO: Route to EnterYourCode screen
            },
            confirmButtonText: 'نعم',
            cancelButtonFun: () {
              //TODO: Route to UserCodeScreen
            },
            cancelButtonText: 'لا',
          ),
          imagePath: assetsImages + 'glasses_star.png',
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ],
    );
  }

  Center _buildSplashLogo() {
    return Center(
      child: Image.asset(
        assetsImages + 'logo.png',
        width: 222.51.w,
        height: 203.79.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
