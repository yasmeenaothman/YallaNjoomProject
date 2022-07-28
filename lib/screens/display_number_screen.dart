import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/example_numbers_bg.dart';

import '../models/my_flutter_app.dart';
import '../widgets/default_circular_avatar.dart';

class DisplayNumberScreen extends StatefulWidget {
  static String routeName = 'DisplayNumberScreen';
  DisplayNumberScreen({Key? key, required this.imageUrl}) : super(key: key);
  String imageUrl;

  @override
  State<DisplayNumberScreen> createState() => _DisplayNumberScreenState();
}

class _DisplayNumberScreenState extends State<DisplayNumberScreen>
    with TickerProviderStateMixin {
  late AnimationController imageController;
  late Animation<double> animation;
  @override
  void initState() {
    imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    imageController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bird.png'),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 77.h, right: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultCirculeAvatar(
                        onTap: () {},
                        iconData: MyFlutterApp.volumeMedium,
                        iconColor: const Color(0xFF034C1B),
                        bgColor: const Color(0xFFDBECC2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: DefaultCirculeAvatar(
                          onTap: () {},
                          iconData: MyFlutterApp.micNone,
                          iconColor: const Color(0xFF034C1B),
                          bgColor: const Color(0xFFDBECC2),
                        ),
                      ),
                      DefaultCirculeAvatar(
                        onTap: () {
                          AppRouter.router.pushNamedWithReplacementFunction(
                              ExampleNumbers.routeName);
                        },
                        iconData: MyFlutterApp.arrowRight_2,
                        iconColor: const Color(0xFF034C1B),
                        bgColor: const Color(0xFFDBECC2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromLTRB(0, 250.h, 0, 0),
                end: RelativeRect.fromLTRB(0, 300.h, 0, 0),
              ).animate(CurvedAnimation(
                parent: imageController,
                curve: Curves.easeIn,
              )),
              child: Image.asset(widget.imageUrl))
        ],
      ),
    );
  }
}
// Padding(
//               padding: EdgeInsets.only(top: 220.h, left: 80.w, right: 160.w),
//               child: Center(child: Image.asset(imageUrl)),
//             ),