import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultElevatedButton extends StatelessWidget {
  Widget child;
  Color bgColor;
  BoxShadow boxShadow;
  Function onPressed;
  double radius;
  double width;
  double height;

  DefaultElevatedButton({
    Key? key,
    required this.child,
    this.bgColor = const Color(0xFF074785),
    this.boxShadow = const BoxShadow(
      offset: Offset(0, 3),
      color: Color(0xB3074785),
      blurRadius: 6,
    ),
    required this.onPressed,
    required this.width, //this.size = const Size(129,44),
    required this.height,
    this.radius = 15,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius.r),
              boxShadow: [boxShadow],
              color: bgColor),
          child: Center(child: child)),
    );
  }
}
