import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/helpers/firestorage_helper.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/screens/test.dart';
import 'package:yalla_njoom/widgets/arithmetic_operation_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import 'package:yalla_njoom/widgets/user_code_dialog.dart';
import '../helpers/my_methods.dart';
import '../models/my_flutter_app.dart';
import '../models/user_model.dart';
import '../widgets/confirm_button_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/default_circular_avatar.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({Key? key}) : super(key: key);
  static const String routeName = 'UserTypeScreen';

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  FirestoreProvider? provider;
  @override
  void initState() {
    provider=Provider.of<FirestoreProvider>(context,listen: false);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    provider!.audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider!.playEncourageAudio('assets/audio/هل انت طفل.mp3');
    return Consumer<FirestoreProvider>(
        builder: (context, fireStoreProvider, x) {

      return ScaffoldWithBackground(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userWidget(
                  context: context,
                  imageName: 'child_user.png',
                  bgColor: Theme.of(context).colorScheme.secondary,
                  text: 'طفل',
                  onTap: () async {
                    String code = await generateNewCode(context);
                    provider!.playEncourageAudio('assets/audio/انتبه.mp3');
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 260.h,
                              ),
                              UserCodeDialog(
                                code: code,
                                onPressed: () async {
                                  ChildModel childModel = ChildModel(
                                      name: 'user_' + code,
                                      imageUrl: await FirestorageHelper
                                          .firestorageHelper
                                          .getDefaultChildImageUrl(),
                                      code: code);
                                  fireStoreProvider.addUser(childModel.toMap());
                                  AppRouter.router.pop();
                                  AppRouter.router.pushNamedFunction(
                                    ChildHomeScreen.routeName,
                                  );
                                },
                              )
                            ],
                          );
                        });
                  }),
              SizedBox(
                height: 50.h,
              ),
              userWidget(
                context: context,
                imageName: 'parent_user.png',
                bgColor: Colors.white,
                text: 'ولي أمر',
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) {

                        return Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: DefaultCirculeAvatar(
                                  onTap: () => AppRouter.router.pop(),
                                  iconData: MyFlutterApp.cancel,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200.h,
                            ),
                            ArthOperationWidget(
                              onPressed: (result) async {
                                if (result) {
                                  AppRouter.router.pop();
                                  String code = await generateNewCode(context);
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (ctx) {
                                        provider!.playEncourageAudio('assets/audio/انتبه.mp3');
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 260.h,
                                            ),
                                            UserCodeDialog(
                                              code: code,
                                              onPressed: () {
                                                ParentModel parentModel =
                                                    ParentModel(
                                                  code: code,
                                                );
                                                fireStoreProvider.addUser(
                                                    parentModel.toMap());

                                                fireStoreProvider
                                                    .getParentsChildren(code);
                                                AppRouter.router.pop();
                                                AppRouter.router
                                                    .pushNamedFunction(
                                                  ParentsHomeScreen.routeName,
                                                );
                                              },
                                            )
                                          ],
                                        );
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (ctx) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 260.h,
                                            ),
                                            CustomDialog(
                                              text: 'الإجابة خاطئة',
                                              spaceBeforeWidget: 20.h,
                                              widget: ConfirmButtonWidget(
                                                confirmButtonFun: () {
                                                  AppRouter.router.pop();
                                                },
                                                confirmButtonText:
                                                    'حاول مرة أخرى',
                                                cancelButtonFun: () {
                                                  AppRouter.router.pop();
                                                  AppRouter.router
                                                      .pop(); //should use another way to delete all the screen and move to UserTypeScreen ama vaktim yok
                                                  AppRouter.router
                                                      .pushNamedWithReplacementFunction(
                                                          UserTypeScreen
                                                              .routeName);
                                                },
                                                cancelButtonText: 'إلغاء',
                                              ),
                                              imagePath:
                                                  'assets/images/crying_star.png',
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                            ),
                                          ],
                                        );
                                      });
                                }
                              },
                            )
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
      );
    });
  }

  Widget userWidget(
      {required BuildContext context,
      required String imageName,
      required Color bgColor,
      required String text,
      required Function() onTap}) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(-3, 0), end: Offset.zero)
          .animate(animation),
      child: RotationTransition(
        turns: Tween<double>(begin: 0, end: 2).animate(animation),
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 180.w,
                height: 180.h,
                child: Image.asset(
                  'assets/images/' + imageName,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).primaryColor,
                        offset: Offset(0.w, 3.h),
                        blurRadius: 6.r)
                  ],
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
