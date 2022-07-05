// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DefaultButton extends StatelessWidget {
//   final Widget child;
//   final Color bgColor;
//   final BoxShadow boxShadow;
//   final Function() onPressed;
//   final double radius;
//   final double width;
//   final double height;

//   const DefaultButton({
//     Key? key,
//     required this.child,
//     this.bgColor = const Color(0xFF074785),
//     this.boxShadow = const BoxShadow(
//       offset: Offset(0, 3),
//       color: Color(0xB3074785),
//       blurRadius: 6,
//     ),
//     required this.onPressed,
//     required this.width, //this.size = const Size(129,44),
//     required this.height,
//     this.radius = 15,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(radius.r),
//               boxShadow: [boxShadow],
//               color: bgColor),
//           child: Center(child: child)),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultElevatedButton extends StatelessWidget {
  Widget child;
  Color bgColor;
  BoxShadow boxShadow;
  Size size;
  double radius;
  double top;
  bool isLocked;
  Function() onPressed;
  DefaultElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.bgColor = const Color(0xFF074785),
    this.isLocked = false,
    this.boxShadow = const BoxShadow(
      offset: Offset(0, 4),
      color: Color(0xB3074785),
      blurRadius: 6,
    ),
    required this.size, //this.size = const Size(129,44),
    this.radius = 15,
    this.top = 15,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: isLocked ? [] : [boxShadow]),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )),
            minimumSize: MaterialStateProperty.all<Size>(size),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.only(top: top)) //symmetric(vertical: 5.h)
            ),
      ),
    );
  }
}
