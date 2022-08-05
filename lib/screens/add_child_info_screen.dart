import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/my_flutter_app.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/child_info_dialog.dart';
import 'package:yalla_njoom/widgets/confirm_button_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../helpers/firestore_helper.dart';
import '../models/user_model.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_elevated_button.dart';

class AddChildInfoScreen extends StatelessWidget {
  static const String routeName = 'AddChildInfoScreen';

  AddChildInfoScreen({Key? key}) : super(key: key);
  String? childCode;
  String? childName;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(
        builder: (context, firestoreProvider, x) {
      return ScaffoldWithBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              DefaultCirculeAvatar(
                onTap: () => AppRouter.router.pushNamedWithReplacementFunction(
                    ParentsHomeScreen.routeName),
                iconData: MyFlutterApp.cancel,
              ),
              SizedBox(
                height: 200.h,
              ),
              ChildInfoDialog(
                onCodeChanged: (code) {
                  childCode = code;
                  print('child code $childCode');
                },
                onNameChanged: (name) {
                  childName = name;
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: DefaultElevatedButton(
                  top: 0,
                  size: Size(129.w, 44.h),
                  radius: 12.r,
                  onPressed: () async {
                    var querySnapshot = await FirestoreHelper.firestoreHelper
                        .getUserByCode(childCode ?? '0');
                    print(childCode);
                    UserModel? currentUser = querySnapshot.docs.isNotEmpty
                        ? querySnapshot.docs[0]["isParent"]
                            ? null
                            : ChildModel.fromMap(querySnapshot.docs[0].data())
                        : null;
                    print('current user$currentUser');
                    if (currentUser != null) {
                      if (!currentUser.isParent) {
                        // firestoreProvider.addChildToParent(
                        //     firestoreProvider.userModel!.code!, {
                        //   ...currentUser.toMap(),
                        //   FirestoreHelper.userNameKey: childName,
                        //   FirestoreHelper.nameSearchKey:
                        //       setSearchParam(childName!),
                        // });
                        firestoreProvider.addChildToParent(
                            firestoreProvider.userModel!.code!, {
                          FirestoreHelper.userCodeKey: currentUser.code,
                          FirestoreHelper.userNameKey: childName,
                          FirestoreHelper.nameSearchKey:
                              setSearchParam(childName!),
                        });

                        AppRouter.router.pushNamedWithReplacementFunction(
                            ParentsHomeScreen.routeName);
                      }
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
                                  text: 'الرمز خاطئ',
                                  spaceBeforeWidget: 20.h,
                                  widget: ConfirmButtonWidget(
                                    confirmButtonFun: () {
                                      AppRouter.router.pop();
                                    },
                                    confirmButtonText: 'حاول مرة أخرى',
                                    cancelButtonFun: () {
                                      AppRouter.router
                                          .pushNamedWithReplacementFunction(
                                              ParentsHomeScreen.routeName);
                                    },
                                    cancelButtonText: 'إلغاء',
                                  ),
                                  imagePath: 'assets/images/crying_star.png',
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                )
                              ],
                            );
                          });
                    }
                  },
                  child: Text(
                    'تسجيل',
                    style: theme.textTheme.headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  setSearchParam(String childName) {
    List<String> nameSearchList = [];
    String temp = "";
    for (int i = 0; i < childName.length; i++) {
      temp = temp + childName[i];
      nameSearchList.add(temp);
    }
    return nameSearchList;
  }
}
