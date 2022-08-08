import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/helpers/firestore_helper.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/screens/do_u_have_acc_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';
import 'package:yalla_njoom/screens/test.dart';
import 'package:yalla_njoom/widgets/default_elevated_button.dart';
import 'package:yalla_njoom/widgets/pin_code_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import '../models/user_model.dart';
import '../widgets/confirm_button_widget.dart';
import '../widgets/custom_dialog.dart';

class EnterYourCodeScreen extends StatefulWidget {
  const EnterYourCodeScreen({Key? key}) : super(key: key);
  static const String routeName = 'EnterYourCodeScreen';

  @override
  State<EnterYourCodeScreen> createState() => _EnterYourCodeScreenState();
}

class _EnterYourCodeScreenState extends State<EnterYourCodeScreen> {
  String userCode = '';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      return ScaffoldWithBackground(
          body: Column(
        children: [
          //TODO: WE HAVE TO ADD CANCEL BUTTON HERE TO NAVIGATE TO THE PREVIOUS PAGE..!
          SizedBox(
            height: 260.h,
          ),
          CustomDialog(
            text: 'أدخل الرمز الخاص بك',
            spaceBeforeWidget: 10.h,
            widget: PinCodeWidget(
              onChanged: (value) {
                userCode = value;
              },
            ),
            imagePath: 'assets/images/smiling_star.png',
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          SizedBox(
            height: 50.h,
          ),
          DefaultElevatedButton(
            top: 0,
            size: Size(129.w, 48.h),
            radius: 12.r,
            onPressed: () async {
              var querySnapshot =
                  await FirestoreHelper.firestoreHelper.getUserByCode(userCode);
              UserModel? currentUser = querySnapshot.docs.isNotEmpty
                  ? querySnapshot.docs[0]["isParent"]
                      ? ParentModel.fromMap(querySnapshot.docs[0].data())
                      : ChildModel.fromMap(querySnapshot.docs[0].data())
                  : null;

              if (currentUser != null) {
                provider.initUser(currentUser.toMap());
                if (currentUser.isParent) {
                  provider.getParentsChildren(currentUser.code!);
                  provider.getNamesDetailList('0', currentUser.code);
                  AppRouter.router.pushNamedWithReplacementFunction(
                    ParentsHomeScreen.routeName,
                  );
                } else {
                  AppRouter.router.pushNamedWithReplacementFunction(
                      ChildHomeScreen.routeName);
                }
              } else {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) {
                      return CustomDialog(
                        text: 'الرمز خاطئ',
                        spaceBeforeWidget: 20.h,
                        widget: ConfirmButtonWidget(
                          confirmButtonFun: () {
                            print('try again!');
                            AppRouter.router.pop();
                          },
                          confirmButtonText: 'حاول مرة أخرى',
                          cancelButtonFun: () {
                            print('cancel!');
                            AppRouter.router.pop();
                            AppRouter.router.pushNamedWithReplacementFunction(
                                DoYouHaveAccScreen.routeName);
                          },
                          cancelButtonText: 'إلغاء',
                        ),
                        imagePath: 'assets/images/crying_star.png',
                        crossAxisAlignment: CrossAxisAlignment.center,
                      );
                    });
              }
            },
            child: Text(
              'دخول',
              style: theme.textTheme.headline3!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ));
    });
  }
}
