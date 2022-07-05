import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithImage extends StatelessWidget {
  List<Widget> children;
  String imageName;
  ColorFilter? colorFilter;
  ContainerWithImage({
    Key? key,
    required this.children,
    required this.imageName,
    this.colorFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageName),
            fit: BoxFit.cover,
            colorFilter: colorFilter,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
