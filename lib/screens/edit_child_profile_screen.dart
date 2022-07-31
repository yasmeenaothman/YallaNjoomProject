import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/helpers/firestore_helper.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';

import '../widgets/default_elevated_button.dart';

class EditChildProfile extends StatelessWidget {
  EditChildProfile({
    Key? key,
  }) : super(key: key);

  static String routeName = 'EditChildProfile';
  TextEditingController? controller;
  // EditChildProfile({Key? key, required this.childModel}) : super(key: key);
  // ChildModel childModel;
  // static String routeName = 'EditChildProfile';
  // TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    controller = TextEditingController(
        text: (Provider.of<FirestoreProvider>(context).userModel as ChildModel)
            .name);
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 88.h,
                ),
                //TODO:make the image.network because it token from firebase
                Image.asset(
                  (provider.userModel as ChildModel).imageUrl!,
                  height: 127.h,
                  width: 127.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'تعديل',
                  style: theme.textTheme.headline1!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  (provider.userModel as ChildModel).code!,
                  style: theme.textTheme.headline1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'الاسم:',
                    textAlign: TextAlign.right,
                    style: theme.textTheme.headline3,
                  ),
                ),
                // SizedBox(height: 10.h,),
                TextField(
                  controller: controller,
                  maxLines: 1,
                  cursorColor: theme.primaryColor,
                  cursorHeight: 24.h,
                  cursorWidth: 1.w,
                  style:
                      theme.textTheme.headline3!.copyWith(color: Colors.black),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0x45544F4F))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF074785)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                DefaultElevatedButton(
                  onPressed: () {
                    ChildModel childModel = ChildModel(
                        name: controller!.text,
                        imageUrl: 'assets/images/kid_img.png',
                        code: (provider.userModel as ChildModel).code);
                    Provider.of<FirestoreProvider>(context, listen: false)
                        .updateChildInfo(childModel);
                    AppRouter.router.pop();
                    AppRouter.router.pushNamedWithReplacementFunction(
                        ChildHomeScreen.routeName);
                  },
                  top: 5.h,
                  radius: 10.r,
                  boxShadow: const BoxShadow(color: Colors.white),
                  size: Size(136.w, 50.h),
                  child: Text(
                    'حفظ',
                    style: theme.textTheme.headline3!
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
