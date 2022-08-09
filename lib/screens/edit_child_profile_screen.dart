import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';

import '../helpers/firestorage_helper.dart';
import '../models/my_flutter_app.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_elevated_button.dart';

class EditChildProfile extends StatefulWidget {
  const EditChildProfile({
    Key? key,
  }) : super(key: key);

  static String routeName = 'EditChildProfile';

  @override
  State<EditChildProfile> createState() => _EditChildProfileState();
}

class _EditChildProfileState extends State<EditChildProfile> {
  TextEditingController? controller;
  String? imageUrl;
  File? file;

  // EditChildProfile({Key? key, required this.childModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    controller = TextEditingController(
        text: (Provider.of<FirestoreProvider>(context).userModel as ChildModel)
            .name);
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.w, top: 25.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DefaultCirculeAvatar(
                        onTap: () => AppRouter.router
                            .pushNamedWithReplacementFunction(
                                ChildHomeScreen.routeName),
                        iconData: MyFlutterApp.cancel,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 88.h,
                  ),

                  GestureDetector(
                      onTap: () async {
                        file = await FirestorageHelper.firestorageHelper
                            .selectFile();
                        if (file != null) {
                          imageUrl = await FirestorageHelper.firestorageHelper
                              .uploadImage(file!);
                          setState(() {});
                        }
                      },
                      child: Container(
                          height: 127.h,
                          width: 127.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: file == null
                                      ? NetworkImage(
                                          (provider.userModel as ChildModel)
                                              .imageUrl!,
                                        )
                                      : FileImage(file!) as ImageProvider),
                              border: Border.all(
                                color: theme.primaryColor,
                                width: 3,
                              )),
                          child: Icon(
                            Icons.camera_alt,
                            color: theme.primaryColor.withOpacity(0.5),
                            size: 50.r,
                          )
                          //  file != null
                          //     ? Image.file(
                          //         file!,
                          //         fit: BoxFit.cover,
                          //       )
                          //     : Image.network(
                          //         (provider.userModel as ChildModel).imageUrl!,
                          //         fit: BoxFit.cover,
                          //       ),
                          )),
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
                    style: theme.textTheme.headline3!
                        .copyWith(color: Colors.black),
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
                          imageUrl: imageUrl ??
                              (provider.userModel as ChildModel).imageUrl,
                          code: (provider.userModel as ChildModel).code,
                          coins: (provider.userModel as ChildModel).coins);
                      Provider.of<FirestoreProvider>(context, listen: false)
                          .updateChildInfo(childModel);

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
        ),
      );
    });
  }
}
