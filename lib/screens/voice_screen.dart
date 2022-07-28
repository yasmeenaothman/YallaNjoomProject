import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/models/my_flutter_app.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ScaffoldWithBackground(
        body: Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: DefaultCirculeAvatar(
                  onTap: () => AppRouter.router.pop(),
                  iconData: MyFlutterApp.cancel,
                )),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: ((context, index) {
                  return _buildVoiceWidget(
                    theme: theme,
                    length: 5,
                    name: 'حرف الألف',
                    isLocked: true,
                  );
                }),
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _buildVoiceWidget(
      {required theme, required length, required name, required isLocked}) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            if (!isLocked)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 65.h,
                child: Icon(
                  Icons.arrow_left,
                  size: 32.r,
                  color: theme.primaryColor,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: theme.primaryColor,
                        offset: Offset(0.w, 3.h),
                        blurRadius: 6.r)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r)),
                ),
              ),
            Expanded(
              child: Container(
                height: 65.h,
                padding: EdgeInsets.all(20.h),
                child: Row(
                  children: [
                    if (!isLocked) ...[
                      Text(
                        'ث ',
                        style: theme.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '$length',
                        style: theme.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                    const Expanded(child: SizedBox()),
                    Text(
                      name,
                      style: theme.textTheme.headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: theme.primaryColor,
                        offset: Offset(0.w, 3.h),
                        blurRadius: 6.r)
                  ],
                  borderRadius: isLocked
                      ? BorderRadius.circular(20.r)
                      : BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)),
                ),
              ),
            ),
          ],
        ),
        if (isLocked)
          Container(
            height: 65.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        if (isLocked)
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Icon(
              MyFlutterApp.micNone,
              color: Colors.white,
            ),
          )
      ],
    );
  }
}
