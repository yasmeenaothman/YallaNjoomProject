import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BravoDialog extends StatelessWidget {
  final String imagePath;
  final Widget? widget;
  final bool isPronunciationWidget;
  final bool lastExample;
  const BravoDialog({
    Key? key,
    required this.imagePath,
    required this.isPronunciationWidget,
    this.lastExample = false,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 30),
            width: 325,
            height: (isPronunciationWidget || lastExample) ? 150.h : 258.h,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DefaultTextStyle(
                  style:
                      theme.textTheme.headline1!.copyWith(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('أحسنت'),
                      if (lastExample) SizedBox(height: 10),
                      lastExample
                          ? Text(
                              'لقد حللت كل الأمثلة',
                            )
                          : Text(
                              !isPronunciationWidget
                                  ? 'الإجابة صحيحة'
                                  : 'النطق صحيح',
                            ),
                      if (!isPronunciationWidget && !lastExample)
                        widget ?? SizedBox(),
                    ],
                  )),
            ),
          ),
          Positioned(
            top: -40,
            left: -10,
            child: Image.asset(imagePath),
          ),
        ],
      ),
    );
  }
}
