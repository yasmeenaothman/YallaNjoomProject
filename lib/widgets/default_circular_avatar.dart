// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DefaultCirculeAvatar extends StatelessWidget {
//   /// here i delay put the arguments to discusses the issuse
//   const DefaultCirculeAvatar(
//       {Key? key,
//       this.padding = 10,
//       required this.imagePath,
//       required this.onTap})
//       : super(key: key);
//   final double padding;
//   final String imagePath;
//   final Function() onTap;
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 40.w,
//         height: 40.h,
//         padding: EdgeInsets.all(padding),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: theme.colorScheme.secondary,
//           boxShadow: [
//             BoxShadow(
//                 color: const Color(0x4D074785),
//                 offset: Offset(3.w, 6.h),
//                 blurRadius: 9.r),
//           ],
//         ),
//         child: Image.asset(
//           imagePath,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/my_flutter_app.dart';

class DefaultCirculeAvatar extends StatelessWidget {
  const DefaultCirculeAvatar(
      {Key? key,
      this.iconData = MyFlutterApp.cancel,
      this.iconColor = const Color(0xFF074785),
      this.bgColor = const Color(0xFFD8EBF7),
      required this.onTap})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final Color bgColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: const Color(0x4D074785),
                offset: Offset(3.w, 6.h),
                blurRadius: 9.r),
          ],
        ),
        child: CircleAvatar(
          child: Icon(
            iconData,
            color: iconColor,
            size: 15.r,
          ),
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
