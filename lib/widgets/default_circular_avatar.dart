import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCirculeAvatar extends StatelessWidget {
  /// here i delay put the arguments to discusses the issuse
  const DefaultCirculeAvatar(
      {Key? key, this.padding = 10, required this.imagePath})
      : super(key: key);
  final double padding;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: 40.w,
      height: 40.h,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
              color: const Color(0x4D074785),
              offset: Offset(3.w, 6.h),
              blurRadius: 9.r),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
