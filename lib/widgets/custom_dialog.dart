import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String text;
  final String imagePath;
  final Widget widget;
  final CrossAxisAlignment crossAxisAlignment;
  const CustomDialog({
    Key? key,
    required this.text,
    required this.widget,
    required this.imagePath,
    required this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(bottom: 70, child: Image.asset(imagePath)),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: 325,
              height: 149,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Text(
                    text,
                    style: theme.textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
